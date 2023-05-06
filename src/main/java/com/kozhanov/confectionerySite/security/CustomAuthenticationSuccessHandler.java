package com.kozhanov.confectionerySite.security;

import com.kozhanov.confectionerySite.dao.CartItemDAO;
import com.kozhanov.confectionerySite.dao.ClientDAO;
import com.kozhanov.confectionerySite.entity.CartItem;
import com.kozhanov.confectionerySite.entity.Client;
import com.kozhanov.confectionerySite.service.CartItemService;
import com.kozhanov.confectionerySite.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

   @Autowired
    ClientService clientService;
   @Autowired
   CartItemService cartItemService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        // Получите имя пользователя (электронную почту) из объекта аутентификации
        String username = authentication.getName();
        // Загрузите клиента на основе имени пользователя (электронной почты)
        Client client = clientService.getClientByPhone(username);

                // Получите все элементы корзины для этого клиента
                List<CartItem> cartItems = cartItemService.getCartItemsByClient(client);

        // Добавьте элементы корзины в сессию
        HttpSession session = request.getSession();
        session.setAttribute("cartItems", cartItems);

        // Перенаправьте на страницу пользователя после успешной аутентификации
        response.sendRedirect("/user/userPage");
    }
}
