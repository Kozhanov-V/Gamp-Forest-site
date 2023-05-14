package com.kozhanov.confectionerySite.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @GetMapping("/adminPage")
    public String showAdminPage(){

        return "AdminPage";
    }


}
