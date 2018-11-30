package com.incon.framework.exception;

/**
 * 权限非法访问的异常类
 * @author Administrator
 *
 */
public class IllegalAccessException extends Exception{
    public IllegalAccessException()  {}                //用来创建无参数对象
    public IllegalAccessException(String message) {        //用来创建指定参数对象
        super(message);                             //调用超类构造器
    }
}
