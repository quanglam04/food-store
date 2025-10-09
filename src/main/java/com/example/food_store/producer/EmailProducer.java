package com.example.food_store.producer;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.food_store.config.RabbitMQConfig;
import com.example.food_store.domain.dto.EmailRequest;

@Service
public class EmailProducer {
    
    @Autowired
    private RabbitTemplate rabbitTemplate;

    public void sendEmailToQueue(EmailRequest emailRequest) {
        rabbitTemplate.convertAndSend(
            RabbitMQConfig.EXCHANGE,
            RabbitMQConfig.ROUTING_KEY,
            emailRequest
        );
    }
}
