package com.idt.boot.mixin;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.idt.boot.entity.Employee;

public abstract class AllocationMixin {

	@JsonBackReference
	abstract Employee getEmployee();
}

