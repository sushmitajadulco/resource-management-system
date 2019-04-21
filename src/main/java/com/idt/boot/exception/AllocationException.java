package com.idt.boot.exception;

public class AllocationException extends RuntimeException {

    public AllocationException(String name) {
        super("Allocation for employee: " + name + " has already excedeed for the given date range");
    }
}
