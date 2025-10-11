package com.example.food_store.repository.specification;

import org.springframework.data.jpa.domain.Specification;
import java.util.List;
import com.example.food_store.domain.Product;
import com.example.food_store.domain.Product_;

public class ProductSpecification {
    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    // case 1
    public static Specification<Product> minPrice(int price) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.ge(root.get(Product_.PRICE), price);
    }

    // case 2
    public static Specification<Product> maxPrice(int price) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.le(root.get(Product_.PRICE), price);
    }

    // case4

    public static Specification<Product> matchListcustomerTarget(List<String> customerTarget) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.CUSTOMER_TARGET))
                .value(customerTarget);
    }

    // case4
    public static Specification<Product> matchListType(List<String> type) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.TYPE)).value(type);
    }

    // case4
    public static Specification<Product> matchListTarget(List<String> target) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.TARGET)).value(target);
    }

    // case5

    public static Specification<Product> matchPrice(int min, int max) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.and(
                criteriaBuilder.gt(root.get(Product_.PRICE), min),
                criteriaBuilder.le(root.get(Product_.PRICE), max));
    }

    // case6
    public static Specification<Product> matchMultiplePrice(int min, int max) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.between(
                root.get(Product_.PRICE), min, max);
    }

}
