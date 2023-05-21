package com.kozhanov.confectionerySite.controller;

import com.kozhanov.confectionerySite.entity.Category;
import com.kozhanov.confectionerySite.entity.Product;
import com.kozhanov.confectionerySite.service.CategoryProductService;
import com.kozhanov.confectionerySite.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryProductService categoryProductService;

    @GetMapping("/adminPage")
    public String showAdminPage(){

        return "AdminPage";
    }
    @GetMapping("/edit/product")
    public String showProducts(Model model){
        List<Product> productList = productService.getAllProducts();
        model.addAttribute("products",productList);
        return "ProductsPage";
    }
    @GetMapping("/edit/categoryProduct")
    public String showProductsCategory(Model model){
        List<Category> categories = categoryProductService.getAllCategoriesProducts();
        model.addAttribute("categories", categories);
        return "CategoryProducts";
    }


}
