package com.kozhanov.confectionerySite.controller;

import com.kozhanov.confectionerySite.entity.CartItem;
import com.kozhanov.confectionerySite.entity.Category;
import com.kozhanov.confectionerySite.entity.Client;
import com.kozhanov.confectionerySite.entity.Product;
import com.kozhanov.confectionerySite.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class MainController {

    @Autowired
    private ProductService productService;

    @Autowired
   private ClientService clientService;



    @Autowired
    private CartItemService cartItemService;


    @Autowired
    private CategoryProductService categoryProductService;

    //-------------------------------------------------

    @GetMapping("/")
    public String showMainPage(Model model){


        List<Product> productsLastSells= productService.getLastSellsProduct(3);
        model.addAttribute("lastSells",productsLastSells);
        return "mainPages/MainView";
    }

    @RequestMapping("/contacts")
    public String showContactsPage(){

        return "mainPages/ContactsView";
    }
    @RequestMapping("/product")
    public String showProductInfoPage(@RequestParam(name = "productId") int id,Model model){
        Product product = productService.getByIdProduct(id);
        List<Product> productsLastSells= productService.getLastSellsProduct(4);

        model.addAttribute("product",product);
        model.addAttribute("lastSells",productsLastSells);
        return "mainPages/ProductInfo";
    }

    @PostMapping("/catalog")
    public String filterProducts(@RequestParam Map<String, String> activatyCategories, Model model
    ) {

        List<Category> categoryList =categoryProductService.getAllCategoriesProducts();

        HashMap<String, String> categories = new HashMap<>();
        for (Category item: categoryList) {
            categories.put(item.getName(),"off");
        }

        int i =0;
        for(Map.Entry<String, String> entry : activatyCategories.entrySet()) {

            String key = entry.getKey();
            String value = entry.getValue();
            if(i==0){
                model.addAttribute(key,value.replaceAll("[^\\d.^-]", ""));
                i++;
                continue;
            }
            System.out.println(entry.getKey()+ " " + entry.getValue());
            categories.put(entry.getKey(),entry.getValue());


        }
        List<Product> filteredProducts = productService.filterProductsByParameters(activatyCategories);

        model.addAttribute("products", filteredProducts);
        model.addAttribute("categories",categories);
        return "mainPages/CatalogView";
    }


    @GetMapping("/catalog")
    public String showCatalogPage(Model model){
        List<Product> productList =productService.getAllProducts();
        List<Category> categoryList =categoryProductService.getAllCategoriesProducts();

        HashMap<String, String> categories = new HashMap<>();
        for (Category item: categoryList) {
            categories.put(item.getName(),"off");
        }
        model.addAttribute("products",productList);
        model.addAttribute("categories",categories);
        return "mainPages/CatalogView";
    }





    @PostMapping(value = "/api/cart/save", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    @ResponseBody
    public ResponseEntity<?> updateCart(@RequestParam("productId") Integer productId,
                                        @RequestParam("quantity") Integer quantity, HttpServletRequest request) {

        try {
            HttpSession session = request.getSession();
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

            if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
                return new ResponseEntity<>(HttpStatus.FORBIDDEN);
            }

            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            Client client = clientService.getClientByPhone(userDetails.getUsername());

            if(client==null){
                return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
            }

            Product product = productService.getByIdProduct(productId);
            CartItem updatedCartItem = new CartItem();
            updatedCartItem = updateCartItemsInSession(session, productId, quantity);

            if(updatedCartItem==null){
                cartItemService.removeProductFromCart(client,product);
            }
            else{
                cartItemService.saveProductToCart(client,product,quantity);
            }

            return new ResponseEntity<>(HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    public CartItem updateCartItemsInSession(HttpSession session, Integer productId, int newQuantity) {
        // Получаем список cartItems из сессии
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        Client client = clientService.getClientByPhone(userDetails.getUsername());
        CartItem nowCartItem = new CartItem(client,productService.getByIdProduct(productId),newQuantity);
        if (cartItems == null) {
            cartItems = new ArrayList<>();
            cartItems.add(nowCartItem);
            session.setAttribute("cartItems", cartItems);
            return nowCartItem;
        }
        boolean check = false;
        // Итерация по списку cartItems с использованием Iterator для безопасного удаления элемента во время итерации
        Iterator<CartItem> iterator = cartItems.iterator();
        CartItem updatedCartItem = null;
        while (iterator.hasNext()) {
            CartItem cartItem = iterator.next();
            if (cartItem.getProduct().getId()==productId) {
                check = true;
                if (cartItem.getQuantity()+newQuantity <= 0) {
                    // Удаляем элемент корзины из списка, если количество равно 0
                    iterator.remove();
                    updatedCartItem = null;
                } else {
                    // Обновляем количество продукта в корзине
                    cartItem.setQuantity(cartItem.getQuantity()+newQuantity);
                    updatedCartItem = cartItem;
                }
                break;
            }
        }



        if(!check){
            cartItems.add(nowCartItem);
            return  nowCartItem;
        }

        // Обновляем список cartItems в сессии
        session.setAttribute("cartItems", cartItems);
        return updatedCartItem;
    }




}
