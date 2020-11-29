package com.spring_gradle.springgradle.service;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import com.spring_gradle.springgradle.entity.HanRiver;

import org.hibernate.internal.build.AllowSysOut;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
public class ServiceTest {
    @Autowired
    private HanRiverService service;

    // @BeforeAll
    // void init() {
    //     if(service == null){
    //         service = new HanRiverService();
    //     }
    // }

    // @Test
    // void testServiceById() {
    //     Long param = Long.valueOf(1);        
    //     HanRiver testData = service.getHanRiverById(param);
    //     System.out.println(testData.getName());
    //     assertNotNull(testData, "SELECT ERR");
    // }

    // @Test
    // void testServiceFindAll() {
    //     List<HanRiver> list = service.getHanRiverInfos();
    //     int cnt = list.size();
    //     assertTrue((cnt > 0));
    // }
}
