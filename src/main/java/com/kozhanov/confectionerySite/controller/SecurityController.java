package com.kozhanov.confectionerySite.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class SecurityController {
    @GetMapping("/loginEmp")
    public String showEmployeeLoginPage() {
        return "loginEmp";
    }

    @GetMapping("/loginClient")
    public String showClientLoginPage() {
        return "loginClient";
    }
    @PostMapping("/loginClient")
    public String showErorLoginPage() {
        return "loginClient";
    }
}
