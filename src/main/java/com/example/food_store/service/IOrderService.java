package com.example.food_store.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.food_store.domain.Order;
import com.example.food_store.domain.User;

public interface IOrderService {
    void deleteById(long id);
    void updateOrder(Order order);
    Page<Order> fetchAllOrders(Pageable pageable);
    List<Order> fetchOrderByUser(User user);
    Optional<Order> fetchOrderById(long id);
}
