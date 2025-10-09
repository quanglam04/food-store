package com.example.food_store.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class BaseController {

  protected final Logger log = LoggerFactory.getLogger(getClass());
}
