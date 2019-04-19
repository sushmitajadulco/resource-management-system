package com.idt.boot.controller;

import com.idt.boot.dto.ProjectDto;
import com.idt.boot.entity.Project;
import com.idt.boot.exception.ResourceNotFoundException;
import com.idt.boot.repository.ProjectRepository;
import com.idt.boot.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

//@RestController
//@RequestMapping("/projects")
@Controller
@RequestMapping("/project")
public class ProjectPortalController {

    @Autowired
    private ProjectService projectService;


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // Date - MM/dd/yyyy
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }

    @GetMapping("/list")
    public String findAll(final Model model)  {
        model.addAttribute("projects", this.projectService.findAll());
        return "project/list";
    }

    @GetMapping("/profile/{id}")
    public String profile(@PathVariable final Long id, final Model model) {
        this.projectService.findById(id).ifPresent(
                project -> model.addAttribute("project", project)
        );
        return "project/profile";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable final Long id, final Model model) {
        this.projectService.findById(id).ifPresent(
                project -> model.addAttribute("project", project)
        );

        return "project/form";
    }

    @GetMapping("/form")
    public String showForm(final Model model) {
        model.addAttribute("project", new Project());
        model.addAttribute( "isAdd", true);
        return "project/form";
    }

    @PostMapping("/add")
    public RedirectView save(@ModelAttribute("project") final Project project, final Model model) {
        this.projectService.save(project);

        model.addAttribute("project", project);

        return new RedirectView("/project/list");
    }

    @PostMapping("/delete/{id}")
    public RedirectView delete(@PathVariable final Long id) {
        this.projectService.delete(id);

        return new RedirectView("/project/list");
    }
}