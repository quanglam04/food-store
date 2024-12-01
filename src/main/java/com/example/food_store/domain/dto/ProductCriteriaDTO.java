package com.example.food_store.domain.dto;

import java.util.List;
import java.util.Optional;

public class ProductCriteriaDTO {
    private Optional<String> page;

    private Optional<List<String>> target;
    private Optional<List<String>> price;
    private Optional<String> sort;
    private Optional<List<String>> type;
    private Optional<List<String>> customertarget;
    private Optional<String> text;

    public Optional<String> getText() {
        return text;
    }

    public void setText(Optional<String> text) {
        this.text = text;
    }

    public Optional<List<String>> getType() {
        return type;
    }

    public void setType(Optional<List<String>> type) {
        this.type = type;
    }

    public Optional<List<String>> getCustomertarget() {
        return customertarget;
    }

    public void setCustomertarget(Optional<List<String>> customertarget) {
        this.customertarget = customertarget;
    }

    public Optional<String> getPage() {
        return page;
    }

    public void setPage(Optional<String> page) {
        this.page = page;
    }

    public Optional<List<String>> getTarget() {
        return target;
    }

    public void setTarget(Optional<List<String>> target) {
        this.target = target;
    }

    public Optional<List<String>> getPrice() {
        return price;
    }

    public void setPrice(Optional<List<String>> price) {
        this.price = price;
    }

    public Optional<String> getSort() {
        return sort;
    }

    public void setSort(Optional<String> sort) {
        this.sort = sort;
    }

}
