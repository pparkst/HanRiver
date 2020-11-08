package com.spring_gradle.springgradle.controller;

import java.util.List;

import com.spring_gradle.springgradle.entity.HanRiver;
import com.spring_gradle.springgradle.service.HanRiverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
public class HanRiverController {
    @Autowired
    private HanRiverService service;
    // @PostMapping("/add")
    // @PutMapping("/update")
    // @DeleteMapping("/delete/{id}")
    
    @GetMapping("/hanRiverById/{id}")
    public HanRiver findHanRiverById(@PathVariable int id)
    {
        return service.getHanRiverById(id);
    }
    @GetMapping("/hanRiver/{name}")
    public HanRiver findHanRiverByName(@PathVariable String name)
    {
        return service.getHanRiverByName(name);
    }

    @GetMapping("/hanRiverAll")
    public List<HanRiver> findHanRiverAll()
    {
        return service.getHanRiverInfos();
    }
}
