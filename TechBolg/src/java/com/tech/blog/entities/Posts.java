/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author PMYLS
 */
public class Posts {
    
    private Integer id;
    private String title;
    private String content;
    private String code;
    private String image;
    private String postedAt;
    private Integer userId;
    private Integer categoryId;

    public Posts() {
    }

    
    public Posts(Integer id, String title, String content, String code, String image, String postedAt, Integer userId, Integer categoryId) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.code = code;
        this.image = image;
        this.postedAt = postedAt;
        this.userId = userId;
        this.categoryId = categoryId;
    }

    public Posts(String title, String content, String code, String image, String postedAt, Integer userId, Integer categoryId) {
        this.title = title;
        this.content = content;
        this.code = code;
        this.image = image;
        this.postedAt = postedAt;
        this.userId = userId;
        this.categoryId = categoryId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPostedAt() {
        return postedAt;
    }

    public void setPostedAt(String postedAt) {
        this.postedAt = postedAt;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
    
    
    
    
    
}
