package com.example.food_store.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.food_store.controller.BaseController;
import com.example.food_store.domain.Order;
import com.example.food_store.domain.OrderDetail;
import com.example.food_store.service.OrderService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OrderController extends BaseController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {

        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getDashboard(Model model,
            @RequestParam("page") Optional<String> pageOptional) {
        log.info("Request to /admin/order");
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                // convert from String to int
                page = Integer.parseInt(pageOptional.get());
            } else {
                // page = 1
            }
            Pageable pageable = PageRequest.of(page - 1, 4);
            Page<Order> ordersPage = this.orderService.fetchAllOrders(pageable);
            List<Order> orders = ordersPage.getContent();
    
            model.addAttribute("orders", orders);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", ordersPage.getTotalPages());
            return "admin/order/show";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Không tìm thấy trang .");
            return "not-match";
        }

    }

    @GetMapping("/admin/order/{id}")
    public String getMethodName(@PathVariable long id, Model model) {
        log.info("Request to /admin/order/{id}");
        Order order = this.orderService.fetchOrderById(id).get();
        List<OrderDetail> orderDetails = order.getOrderDetails();
        model.addAttribute("id", id);
        model.addAttribute("orderDetails", orderDetails);
        model.addAttribute("order", order);
        return "admin/order/detail";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String getDeleteOrderPage(Model model, @PathVariable long id) {
        log.info("Request to /admin/order/delete/{id}");
        model.addAttribute("id", id);
        model.addAttribute("newOrder", new Order());
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String postDeleteOrder(@ModelAttribute("newOrder") Order order) {
        log.info("Request to /admin/order/delete");
        this.orderService.deleteById(order.getId());
        return "redirect:/admin/order";

    }

    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrderPage(Model model, @PathVariable long id) {
        log.info("Request to /admin/order/update/{id}");
        Optional<Order> currentOrder = this.orderService.fetchOrderById(id);
        model.addAttribute("newOrder", currentOrder.get());
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String handleUpdateOrder(@ModelAttribute("newOrder") Order order) {
        log.info("Request to /admin/order/update");
        this.orderService.updateOrder(order);
        return "redirect:/admin/order";
    }
    

}
