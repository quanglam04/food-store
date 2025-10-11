package com.example.food_store.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.food_store.controller.BaseController;
import com.example.food_store.service.impl.ProductService;
import com.example.food_store.service.impl.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DashBoardController extends BaseController {
    private final UserService userService;
    private final ProductService productService;

    @GetMapping("/admin")
    public String getDashBoard(Model model) {
        log.info("Request to /admin");
        model.addAttribute("countUser", this.userService.countUser());
        model.addAttribute("countOrder",  this.userService.countOrder());
        model.addAttribute("countProduct",  this.productService.countProduct());
        return "admin/dashboard/show";
    }

}
