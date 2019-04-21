package com.idt.boot.common;

public enum AllocationPercentage {

    ZERO(0.0),
    TWENTY_FIVE(0.25),
    FIFTY(0.5),
    SEVENTY_FIVE(0.75),
    ONE(1.0);

    private Double percentage;

    AllocationPercentage(Double percentage) {
        this.percentage = percentage;
    }

    public Double getPercentage() {
        return percentage;
    }
}
