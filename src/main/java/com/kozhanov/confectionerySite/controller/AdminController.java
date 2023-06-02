package com.kozhanov.confectionerySite.controller;

import com.kozhanov.confectionerySite.dto.OrderDTO;
import com.kozhanov.confectionerySite.entity.*;
import com.kozhanov.confectionerySite.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
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
        List<Category> categoryList = categoryProductService.getAllCategoriesProducts();
        model.addAttribute("categoryList",categoryList);
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
        List<Product> productList = productService.getAllProducts();
        System.out.println(productList);
        model.addAttribute("allProducts",productList);
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
    @PostMapping("/api/client/update")
    public ResponseEntity<String> updateClient(@RequestParam(name = "id") int id,
                                               @RequestParam(name = "fullname") String fullname,
                                               @RequestParam(name = "phone") String phone,
                                               @RequestParam(name = "email") String email) {
      Client client = clientService.getClientById(id);
      client.setFullName(fullname);
      client.setPhone(phone);
      client.setEmail(email);
       clientService.updateClient(client);
        return new ResponseEntity<>("Успешно обновлено", HttpStatus.OK);
    }

    @PostMapping("/api/product/update")
    public ResponseEntity<String> updateProduct(@RequestParam(name = "id") int id,
                                               @RequestParam(name = "name") String name,
                                               @RequestParam(name = "categoryId") int categoryId,
                                               @RequestParam(name = "description") String description,
                                               @RequestParam(name = "price") BigDecimal price,
                                               @RequestParam(name = "stock") byte stock
    ) {

        System.out.println(id + name+categoryId+description+price+stock);
      Product product = productService.getByIdProduct(id);
      product.setName(name);
      product.setCategory(categoryProductService.getByIdCategory(categoryId));
        product.setDescription(description);
        product.setPrice(price);
        product.setIsStock(stock);
        productService.updateProduct(product);
        return new ResponseEntity<>("Успешно обновлено", HttpStatus.OK);
    }
    @PostMapping("/api/category/update")
    public ResponseEntity<String> updateCategory(@RequestParam(name = "id") int id,
                                               @RequestParam(name = "productName") String productName,
                                               @RequestParam(name = "description") String description
    ) {

     Category category = categoryProductService.getByIdCategory(id);
     category.setName(productName);
     category.setDescription(description);
     categoryProductService.updateCategory(category);
        return new ResponseEntity<>("Успешно обновлено", HttpStatus.OK);
    }




    @PostMapping("/api/client/delete")
    public ResponseEntity<String> deleteClient(@RequestParam(name = "id") int id) {
      Client client = clientService.getClientById(id);
      clientService.deleteClient(id);
      return new ResponseEntity<>("Успешно обновлено", HttpStatus.OK);
    }

    @PostMapping("/api/product/delete")
    public ResponseEntity<String> deleteProduct(@RequestParam(name = "id") int id) {
      productService.deleteProduct(id);
      return new ResponseEntity<>("Успешно обновлено", HttpStatus.OK);
    }
    @PostMapping("/api/category/delete")
    public ResponseEntity<String> deleteCategory(@RequestParam(name = "id") int id) {
      categoryProductService.deleteCategory(id);
      return new ResponseEntity<>("Успешно обновлено", HttpStatus.OK);
    }



}
