package com.example.demo.Exception;

import org.springframework.http.HttpStatus;

public class CustomException extends RuntimeException {
    private final String customMessage;
    private final HttpStatus httpStatus;

    public CustomException(String customMessage) {
        this(customMessage, HttpStatus.BAD_REQUEST);
    }

    public CustomException(String customMessage, HttpStatus httpStatus) {
        super(customMessage);
        this.customMessage = customMessage;
        this.httpStatus = httpStatus;
    }

    public String getCustomMessage() {
        return customMessage;
    }

    public HttpStatus getHttpStatus() {
        return httpStatus;
    }
}

