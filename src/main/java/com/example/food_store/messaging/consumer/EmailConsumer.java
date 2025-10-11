package com.example.food_store.messaging.consumer;


import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.food_store.constant.AppConstant;
import com.example.food_store.messaging.message.EmailRequest;
import com.example.food_store.service.impl.SendEmailService;

@Component
public class EmailConsumer {

    @Autowired
    private SendEmailService sendEmail;

    @RabbitListener(queues = AppConstant.QUEUE)
    public void receiveEmailMessage(EmailRequest emailRequest) {
        sendEmail.sendEmail(emailRequest.getToEmail(),
                            emailRequest.getSubject(),
                            emailRequest.getBody());
    }
}
