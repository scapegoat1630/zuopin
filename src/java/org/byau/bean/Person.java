/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.byau.bean;

/**
 *
 * @author Administrator
 */
public class Person implements java.io.Serializable{   
    private String name;   
    private String sex;   
    private Integer age;   
   
    public String getName() {   
        return name;   
    }   
    public void setName(String name) {   
        this.name = name;   
    }   
    public String getSex() {   
        return sex;   
    }   
    public void setSex(String sex) {   
        this.sex = sex;   
    }   
    public Integer getAge() {   
        return age;   
    }   
    public void setAge(Integer age) {   
        this.age = age;   
    }   
     
} 
