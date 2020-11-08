package com.spring_gradle.springgradle.repository;

import com.spring_gradle.springgradle.entity.HanRiver;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HanRiverRepository extends JpaRepository<HanRiver,Integer>
{
    HanRiver findByName(String name);
}
 