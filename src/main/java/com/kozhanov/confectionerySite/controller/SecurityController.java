package com.kozhanov.confectionerySite.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class SecurityController {
    @GetMapping("/admin/loginEmp")
    public String showEmployeeLoginPage() {
        return "loginEmp";
    }

    @GetMapping("/user/login")
    public String showClientLoginPage() {
        return "loginClient";
    }
}
