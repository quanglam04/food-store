package com.example.food_store.consumer;


import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.food_store.service.sendEmail.SendEmail;
import com.example.food_store.config.RabbitMQConfig;
import com.example.food_store.domain.dto.EmailRequest;

@Component
public class EmailConsumer {

    @Autowired
    private SendEmail sendEmail;

    @RabbitListener(queues = RabbitMQConfig.QUEUE)
    public void receiveEmailMessage(EmailRequest emailRequest) {
        sendEmail.sendEmail(emailRequest.getToEmail(),
                            emailRequest.getSubject(),
                            emailRequest.getBody());
    }
}
