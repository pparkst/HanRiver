package com.spring_gradle.springgradle.repository;

import com.spring_gradle.springgradle.entity.HanRiver;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface HanRiverRepository extends JpaRepository<HanRiver,Long>
{
    HanRiver findByName(String name);

    @Query(value = "SELECT * FROM tbl_hanRiverInfo t ORDER BY 1 DESC LIMIT 1;", nativeQuery = true)
    HanRiver findLatestData();
}
 