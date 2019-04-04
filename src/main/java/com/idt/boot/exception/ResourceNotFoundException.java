package com.idt.boot.exception;

public class ResourceNotFoundException extends Exception {

    public ResourceNotFoundException() {
        super("Resource not found");
    }
}

