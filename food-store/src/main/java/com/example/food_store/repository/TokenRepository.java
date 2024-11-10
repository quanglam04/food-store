package com.example.food_store.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.food_store.domain.Token;

@Repository
public interface TokenRepository extends JpaRepository<Token, Long> {
    @Query("SELECT t.email FROM Token t WHERE t.token = :token")
    String findEmailByToken(@Param("token") String token);

}
