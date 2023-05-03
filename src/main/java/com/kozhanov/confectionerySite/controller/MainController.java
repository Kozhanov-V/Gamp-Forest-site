package com.kozhanov.confectionerySite.controller;

import com.kozhanov.confectionerySite.entity.Client;
import com.kozhanov.confectionerySite.entity.Product;
import com.kozhanov.confectionerySite.security.ClientUserDetails;
import com.kozhanov.confectionerySite.security.ClientUserDetailsService;
import com.kozhanov.confectionerySite.service.CartItemService;
import com.kozhanov.confectionerySite.service.ClientService;
import com.kozhanov.confectionerySite.service.OrderedProductService;
import com.kozhanov.confectionerySite.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.security.Principal;
import java.util.Collection;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private ProductService productService;

    @Autowired
   private ClientService clientService;

    @Autowired
   private OrderedProductService orderedProductService;

    @Autowired
    private ClientUserDetailsService clientUserDetailsService;

    @Autowired
    private CartItemService cartItemService;

    //-------------------------------------------------

    @GetMapping("/")
    public String showMainPage(Model model){


        List<Product> productsLastSells= productService.getLastSellsProduct(3);
        model.addAttribute("lastSells",productsLastSells);
        return "MainView";
    }

    @RequestMapping("/contacts")
    public String showContactsPage(){

        return "ContactsView";
    }
    @RequestMapping("/product")
    public String showProductInfoPage(@RequestParam(name = "productId") int id,Model model){
        Product product = productService.getByIdProduct(id);
        List<Product> productsLastSells= productService.getLastSellsProduct(4);

        model.addAttribute("product",product);
        model.addAttribute("lastSells",productsLastSells);
        return "ProductInfo";
    }

    @PostMapping("/catalog")
    public String filterProducts(
            @RequestParam String price,
            @RequestParam(required = false) boolean chizkeik,
            @RequestParam(required = false) boolean naborChizkeik,
            Model model
    ) {
        // Фильтрация продуктов на основе параметров
        List<Product> filteredProducts = productService.filterProductsByParameters(price, chizkeik, naborChizkeik);
        model.addAttribute("products", filteredProducts);
        model.addAttribute("currentChizkeik", chizkeik);
        model.addAttribute("currentNaborChizkeik", naborChizkeik);
        model.addAttribute("price",price.replaceAll("[^\\d.^-]", ""));
        // Возвращаем страницу со списком продуктов после применения фильтров
        return "CatalogView";
    }


    @GetMapping("/catalog")
    public String showCatalogPage(Model model){
        List<Product> productList =productService.getAllProducts();
        model.addAttribute("products",productList);
        return "CatalogView";
    }

    //-------------------------------------------------
    @GetMapping("/admin/adminPage")
    public String showAdminPage(){

        return "adminPage";
    }


    //-------------------------------------------------





    @GetMapping("/user/userPage")
    public String showUserPage(Model model){

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        Client client = clientService.getClientByPhone(userDetails.getUsername());

        List<Product> productList = orderedProductService.getSellsByUser(client.getId(),4);

        model.addAttribute("lastSells",productList);

        model.addAttribute("client",client);



        return "userPage";
    }

    @PostMapping("/user/updateUser")
    public  String updateUser(@ModelAttribute Client client){
         clientService.updateClient(client);

         
        // Получение объекта UserDetails для обновленного пользователя
        UserDetails userDetails = clientUserDetailsService.loadUserByUsername(client.getPhone());

        // Получение текущих прав доступа пользователя
        Collection<SimpleGrantedAuthority> nowAuthorities =
                (Collection<SimpleGrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();

        // Создание нового объекта аутентификации с обновленным объектом UserDetails
        UsernamePasswordAuthenticationToken authentication =
                new UsernamePasswordAuthenticationToken(userDetails, userDetails.getPassword(), nowAuthorities);

        // Обновление контекста аутентификации в Spring Security
        SecurityContextHolder.getContext().setAuthentication(authentication);


        return "redirect:/user/userPage";
    }



    @PostMapping(value = "/user/cart/save", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    @ResponseBody
    public ResponseEntity<?> updateCart(@RequestParam("productId") Integer productId,
                                        @RequestParam("quantity") Integer quantity) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        Client client = clientService.getClientByPhone(userDetails.getUsername());
        System.out.println(productId + " " + client.getId() + " " + quantity);

        try {

            cartItemService.saveProductToCart(client.getId(), productId, quantity);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    //-------------------------------------------------

}
