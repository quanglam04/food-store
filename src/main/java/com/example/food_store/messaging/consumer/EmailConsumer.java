package com.example.food_store.messaging.consumer;


import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.food_store.config.RabbitMQConfig;
import com.example.food_store.messaging.message.EmailRequest;
import com.example.food_store.service.SendEmailService;

@Component
public class EmailConsumer {

    @Autowired
    private SendEmailService sendEmail;

    @RabbitListener(queues = RabbitMQConfig.QUEUE)
    public void receiveEmailMessage(EmailRequest emailRequest) {
        sendEmail.sendEmail(emailRequest.getToEmail(),
                            emailRequest.getSubject(),
                            emailRequest.getBody());
    }
}
