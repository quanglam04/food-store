package com.example.food_store.utils;

import java.util.Random;

public class AppUtil {

    public static final String getRandomOTP() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }
}
