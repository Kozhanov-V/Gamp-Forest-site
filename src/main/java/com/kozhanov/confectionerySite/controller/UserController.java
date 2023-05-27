package com.kozhanov.confectionerySite.controller;

import com.kozhanov.confectionerySite.entity.Client;
import com.kozhanov.confectionerySite.entity.Product;
import com.kozhanov.confectionerySite.security.ClientUserDetailsService;
import com.kozhanov.confectionerySite.service.CartItemService;
import com.kozhanov.confectionerySite.service.ClientService;
import com.kozhanov.confectionerySite.service.OrderedProductService;
import com.kozhanov.confectionerySite.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.Collection;
import java.util.List;

@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    private OrderedProductService orderedProductService;

    @Autowired
    private ClientUserDetailsService clientUserDetailsService;

    @Autowired
    private ClientService clientService;

    @Autowired
    private CartItemService cartItemService;

    @Autowired
    private ProductService productService;

    @GetMapping("/userPage")
    public String showUserPage(Model model){

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        Client client = clientService.getClientByPhone(userDetails.getUsername());

        List<Product> productList = orderedProductService.getSellsByUser(client.getId(),4);

        model.addAttribute("lastSells",productList);

        model.addAttribute("client",client);



        return "userPages/UserPage";
    }

    @PostMapping("/updateUser")
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

    @GetMapping("/cart")
    public String showCartPage(Model model){

        List<Product> productsLastSells= productService.getLastSellsProduct(4);
        model.addAttribute("lastSells", productsLastSells);
        return "userPages/CartPage";
    }


    @GetMapping("/isAuthenticated")
    @ResponseBody
    public boolean isAuthenticated(Principal principal) {
        System.out.println("check");
        return principal != null;
    }

}
