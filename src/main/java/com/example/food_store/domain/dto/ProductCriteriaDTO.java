package com.example.food_store.domain.dto;

import java.util.List;
import java.util.Optional;

import lombok.Data;

@Data
public class ProductCriteriaDTO {
    private Optional<String> page;

    private Optional<List<String>> target;
    private Optional<List<String>> price;
    private Optional<String> sort;
    private Optional<List<String>> type;
    private Optional<List<String>> customertarget;
    private Optional<String> text;


}
