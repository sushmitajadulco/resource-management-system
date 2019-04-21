package com.idt.boot.controller;

import com.idt.boot.entity.Project;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/project")
public class ProjectController {

    @GetMapping("/list")
    public String getList() {
        return "project/list";
    }

    @PostMapping("/delete/{id}")
    public RedirectView remove(@PathVariable final Long id) {
        return new RedirectView("/project/list");
    }

    @PostMapping("/add")
    public RedirectView saveProject(@ModelAttribute("project") final Project project) {
        return new RedirectView("/project/add");
    }

    @GetMapping("/profile/{id}")
    public String getProfile(@PathVariable final Long id, final Model model) {
        return "project/profile";
    }

    @GetMapping("/form")
    public String getForm(final Model model) {
        return "project/form";
    }

    @GetMapping("/edit/{id}")
    public String editProject(@PathVariable final Long id, final Model model) {
        return "project/form";
    }
}
