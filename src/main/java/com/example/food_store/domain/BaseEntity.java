package com.example.food_store.domain;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

import com.example.food_store.constant.AppConstant;

import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@MappedSuperclass
public class BaseEntity {

  @Column(name = "CREATE_DAY_TIME")
  private String createDayTime;

  @Column(name = "UPDATE_DAY_TIME")
  private String updateDayTime;


  @PrePersist
  public void prePersist() {
    this.createDayTime = LocalDateTime.now().format(AppConstant.formatter);
    this.updateDayTime = this.createDayTime;
  }

  @PreUpdate
  public void preUpdate() {
    if (this.createDayTime == null) {
      this.createDayTime = LocalDateTime.now().format(AppConstant.formatter);
    }
    this.updateDayTime = LocalDateTime.now().format(AppConstant.formatter);
  }
}

