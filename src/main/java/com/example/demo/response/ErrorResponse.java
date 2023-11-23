package com.example.demo.response;

public class ErrorResponse {
    private String messages;

    public ErrorResponse(String messages) {
        this.messages = messages;
    }

    public String getMessages() {
        return messages;
    }

    public void setMessages(String messages) {
        this.messages = messages;
    }
}
