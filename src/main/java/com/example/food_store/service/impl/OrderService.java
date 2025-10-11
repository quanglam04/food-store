package com.example.food_store.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.example.food_store.domain.Order;
import com.example.food_store.domain.OrderDetail;
import com.example.food_store.domain.User;
import com.example.food_store.repository.OrderDetailRepository;
import com.example.food_store.repository.OrderRepository;
import com.example.food_store.service.IOrderService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderService implements IOrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    @Override
    public Page<Order> fetchAllOrders(Pageable pageable) {
        return this.orderRepository.findAll(pageable);
    }

    @Override
    public Optional<Order> fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    @Override
    public List<Order> fetchOrderByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

    @Override
    public void deleteById(long id) {
        // xóa order detail
        Optional<Order> orderOptional = this.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails)
                this.orderDetailRepository.deleteById(orderDetail.getId());

        }
        this.orderRepository.deleteById(id);
    }

    @Override
    public void updateOrder(Order order) {
        Optional<Order> orderOptional = this.fetchOrderById(order.getId());
        if (orderOptional.isPresent()) {
            Order currentOrder = orderOptional.get();
            currentOrder.setStatus(order.getStatus());
            this.orderRepository.save(currentOrder);
        }
    }
}
