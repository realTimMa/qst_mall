package com.qst.common;

import java.io.Serializable;

public class Result<T> implements Serializable {
   private static final long serialVersionUID=1L;
    private String message;
    private T data;

    public Result() {
    }

    public Result(String message, T data) {
        this.message = message;
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "Result{" +
                "message='" + message + '\'' +
                ", data=" + data +
                '}';
    }
}
