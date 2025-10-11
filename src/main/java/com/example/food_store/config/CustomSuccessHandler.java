package com.example.food_store.config;

import java.io.IOException;

import java.util.Map;
import java.util.HashMap;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.example.food_store.domain.User;
import com.example.food_store.service.impl.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class CustomSuccessHandler implements AuthenticationSuccessHandler {
    private UserService userService;
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    protected String determineTargetUrl(final Authentication authentication) {
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        Map<String, String> roleTargetUrlMap = new HashMap<>();
        roleTargetUrlMap.put("ROLE_USER", "/");
        roleTargetUrlMap.put("ROLE_ADMIN", "/admin");
        for (final GrantedAuthority grantedAuthority : authorities) {
            String authorityName = grantedAuthority.getAuthority();
            if (roleTargetUrlMap.containsKey(authorityName)) {
                return roleTargetUrlMap.get(authorityName);
            }
        }
        throw new IllegalStateException();
    }

    protected void clearAuthenticationAttributes(HttpServletRequest request, Authentication authentication) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
        String email = authentication.getName();
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            session.setAttribute("role", user.getRole().getName());
            session.setAttribute("fullName", user.getFullName());
            session.setAttribute("avatar", user.getAvatar());
            session.setAttribute("id", user.getId());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("sum", (user.getCart() == null ? 0 : user.getCart().getSum()));
        }
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String targetURL = determineTargetUrl(authentication);
        if (response.isCommitted()) {
            return;
        }
        redirectStrategy.sendRedirect(request, response, targetURL);
        clearAuthenticationAttributes(request, authentication);
    }

}
