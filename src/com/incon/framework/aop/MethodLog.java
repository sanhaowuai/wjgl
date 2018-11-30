package com.incon.framework.aop;

import java.lang.annotation.Documented;  
import java.lang.annotation.ElementType;  
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;  
import java.lang.annotation.RetentionPolicy;  
import java.lang.annotation.Target;
@Target({ ElementType.METHOD})  
@Retention(RetentionPolicy.RUNTIME)  
@Inherited
@Documented
public @interface MethodLog {
	String description() default "";
}
