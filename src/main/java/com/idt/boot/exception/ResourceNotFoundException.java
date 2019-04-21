package com.idt.boot.exception;

public class ResourceNotFoundException extends RuntimeException {

    public ResourceNotFoundException() {
        super("Resource not found");
    }

    public ResourceNotFoundException(Class clazz, Object id) {
        super("Entity " + clazz + " with id " + id + " does not exist.");
    }
}

