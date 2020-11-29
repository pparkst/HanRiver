package com.spring_gradle.springgradle.service;

import com.spring_gradle.springgradle.entity.HanRiver;
import com.spring_gradle.springgradle.repository.HanRiverRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import java.util.List;

@Service
public class HanRiverService {
    @Autowired
    private HanRiverRepository repository;

    public List<HanRiver> getHanRiverInfos()
    {
        return repository.findAll();
    }

    public HanRiver getHanRiverById(Long id)
    {
        return repository.findById(id).orElse(null);
    }

    public HanRiver getHanRiverByName(String name)
    {
        return repository.findByName(name);
    }

    public HanRiver getHanRiverLatestData()
    {
        return repository.findLatestData();
    }
}
