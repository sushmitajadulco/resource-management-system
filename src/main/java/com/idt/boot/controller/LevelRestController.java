package com.idt.boot.controller;

import com.idt.boot.entity.Level;
import com.idt.boot.repository.LevelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/level")
public class LevelRestController {

    @Autowired
    private LevelRepository levelRepository;

    @GetMapping("/list")
    private List<Level> getAllLevels() {
        return levelRepository.findAll();
    }
}
