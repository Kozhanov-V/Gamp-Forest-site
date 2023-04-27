package com.kozhanov.confectionerySite.controller;

import com.kozhanov.confectionerySite.entity.Product;
import com.kozhanov.confectionerySite.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    ProductService productService;

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
    @GetMapping("/admin")
    public String showAdminPage(){

        return "adminPage";
    }

}
