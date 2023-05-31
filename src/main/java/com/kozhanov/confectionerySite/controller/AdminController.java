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

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private PurchaseService purchaseService;

    @Autowired
    private SupplierService supplierService;

    @GetMapping("/adminPage")
    public String showAdminPage(){

        return "adminPages/AdminPage";
    }
    @GetMapping("/edit/product")
    public String showProducts(Model model){
        List<Product> productList = productService.getAllProducts();
        model.addAttribute("products",productList);
        return "adminPages/ProductsPage";
    }
    @GetMapping("/edit/categoryProduct")
    public String showProductsCategory(Model model){
        List<Category> categories = categoryProductService.getAllCategoriesProducts();
        model.addAttribute("categories", categories);
        return "adminPages/CategoryProducts";
    }

    @GetMapping("/edit/order")
    public String showAllOrders(Model model){
        List<OrderDTO> orderedProductList = orderService.getAllOrder();
        model.addAttribute("allOrders",orderedProductList);
        return "adminPages/AllOrders";
    }

    @GetMapping("/edit/client")
    public String showAllClients(Model model){
        List<Client> clients = clientService.getAllClients();
        model.addAttribute("clientList",clients);
        return "adminPages/AllClients";
    }
    @GetMapping("/edit/employee")
    public String showAllEmployees(Model model){
        List<Employee> employeeList = employeeService.getAllEmployees();
        model.addAttribute("employeeList",employeeList);
        return "adminPages/AllEmployees";
    }
    @GetMapping("/edit/purchases")
    public String showAllPurchase(Model model){
        List<Purchase> purchaseList = purchaseService.getAllPurchase();
        model.addAttribute("purchaseList",purchaseList);
        return "adminPages/AllPurchases";
    }
    @GetMapping("/edit/suppliers")
    public String showAllSupplier(Model model){
        List<Supplier> supplierList = supplierService.getAllSupplier();
        model.addAttribute("supplierList",supplierList);
        return "adminPages/AllSuppliers";
    }


}
