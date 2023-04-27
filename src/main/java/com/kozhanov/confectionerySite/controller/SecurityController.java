package com.kozhanov.confectionerySite.controller;

import com.kozhanov.confectionerySite.entity.Employee;
import com.kozhanov.confectionerySite.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class SecurityController {

    @Autowired
    EmployeeService employeeService;

    @GetMapping("/loginEmp")
    public String loginPage(HttpServletRequest request, HttpSession session, Model model) {
        String referrer = request.getHeader("referer");
        session.setAttribute("previousPage", referrer);
        return "loginPage";
    }



    @PostMapping("/loginEmp")
    public String checkAuth(@RequestParam(name = "nameLogin")String login,
                            @RequestParam(name = "passwordLogin")String password, Model model,
                            HttpSession session) {

        System.out.println(login + " " + password);


    Employee employee = employeeService.getEmployeeByLoginAndPassword(login,password);

        boolean authenticationIsSuccessful =   employee ==null ? false : true;

      if(!employee.isEnabled()) {
          model.addAttribute("errorMessage", "Your account is disabled");
          return "loginPage";
      }
        if (authenticationIsSuccessful) {
            // Сохраните информацию о пользователе в сессии
            session.setAttribute("employee", employee);
            System.out.println(employee);
            return "redirect:/admin/";

        } else {
            // Если аутентификация не удалась, отправьте ошибку обратно на страницу логина
            model.addAttribute("errorMessage", "Invalid username or password");
            return "loginPage";
        }



    }

}
