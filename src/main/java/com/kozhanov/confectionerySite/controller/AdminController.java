package com.kozhanov.confectionerySite.controller;

import com.kozhanov.confectionerySite.dto.OrderDTO;
import com.kozhanov.confectionerySite.entity.*;
import com.kozhanov.confectionerySite.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryProductService categoryProductService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderedProductService orderedProductService;

    @Autowired
    private ClientService clientService;

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

    @GetMapping("/edit/order")
    public String showAllOrders(Model model){
        List<OrderDTO> orderedProductList = orderService.getAllOrder();
        model.addAttribute("allOrders",orderedProductList);
        return "AllOrders";
    }

    @GetMapping("/edit/client")
    public String showAllClients(Model model){
        List<Client> clients = clientService.getAllClients();
        model.addAttribute("clientList",clients);
        return "AllClients";
    }


}
