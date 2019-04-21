package com.idt.boot.controller;



import com.idt.boot.entity.Project;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;


@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @GetMapping("/list")
    public String getList() {
        return "employee/list";
    }

    @PostMapping("/delete/{id}")
    public RedirectView remove(@PathVariable final Long id) {
        return new RedirectView("/employee/list");
    }

    @PostMapping("/add")
    public RedirectView saveProject(@ModelAttribute("employee") final Project project) {
        return new RedirectView("/employee/add");
    }

    @GetMapping("/profile/{id}")
    public String getProfile(@PathVariable final Long id, final Model model) {
        return "employee/profile";
    }

    @GetMapping("/form")
    public String getForm(final Model model) {
        return "employee/form";
    }

    @GetMapping("/edit/{id}")
    public String editProject(@PathVariable final Long id, final Model model) {
        return "employee/form";
    }

}
