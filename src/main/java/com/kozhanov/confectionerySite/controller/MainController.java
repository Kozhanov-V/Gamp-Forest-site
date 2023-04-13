package com.kozhanov.confectionerySite.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/")
    public String showMainPage(){

        return "MainView";
    }
    @RequestMapping("/catalog")
    public String showCatalogPage(){

        return "CatalogView";
    }
    @RequestMapping("/contacts")
    public String showContactsPage(){

        return "ContactsView";
    }
    @RequestMapping("/product")
    public String showProductInfoPage(){

        return "ProductInfo";
    }
}
