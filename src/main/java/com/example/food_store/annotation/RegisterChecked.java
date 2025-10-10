package com.example.food_store.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.example.food_store.annotation.validator.RegosterCheckedValidator;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

@Constraint(validatedBy = RegosterCheckedValidator.class)
@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RegisterChecked {

    String message() default "User register validation failed";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
