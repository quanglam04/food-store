package com.example.food_store.messaging.producer;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.food_store.constant.AppConstant;
import com.example.food_store.messaging.message.EmailRequest;

@Service
public class EmailProducer {
    
    @Autowired
    private RabbitTemplate rabbitTemplate;

    public void sendEmailToQueue(EmailRequest emailRequest) {
        rabbitTemplate.convertAndSend(
            AppConstant.EXCHANGE,
            AppConstant.ROUTING_KEY,
            emailRequest
        );
    }
}
