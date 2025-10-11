package com.example.food_store.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.example.food_store.domain.Product;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
    long count();
    long countByType(String type);
    Page<Product> findAll(Pageable page);
    Page<Product> findAll(Specification<Product> spec, Pageable page);
    List<Product> findByType(String type);
}
