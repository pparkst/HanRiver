package com.spring_gradle.springgradle.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbl_hanRiverInfo")
public class HanRiver {
    @Id
    @GeneratedValue
    private int no_;
    private String name;
    private float temperature;
    private LocalDateTime created;

    public int getNo_() {
        return no_;
    }

    public void setNo_(int no_) {
        this.no_ = no_;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getTemperature() {
        return temperature;
    }

    public void setTemperature(float temperature) {
        this.temperature = temperature;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }
}
