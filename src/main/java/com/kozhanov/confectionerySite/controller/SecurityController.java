package com.kozhanov.confectionerySite.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class SecurityController {
    @GetMapping("/admin/loginEmp")
    public String showEmployeeLoginPage(@RequestParam(name = "error",required = false) boolean error, HttpServletRequest request, HttpSession session ) {
       if(!error) {
           String referrer = request.getHeader("referer");
           session.setAttribute("previousPage", referrer);
       }
        return "authPages/loginEmp";
    }

    @GetMapping("/user/login")
    public String showClientLoginPage(@RequestParam(name = "error",required = false) boolean error,HttpServletRequest request, HttpSession session) {
        if(!error) {
            String referrer = request.getHeader("referer");
            session.setAttribute("previousPage", referrer);
        }

        return "authPages/loginClient";
    }
}
