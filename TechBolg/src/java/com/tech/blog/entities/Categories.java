package com.tech.blog.entities;

public class Categories {

    private Integer id;
    private String category;
    private String description;
    private String createdAt;

    public Categories() {
    }

    public Categories(Integer id, String category, String description, String created_At) {
        this.id = id;
        this.category = category;
        this.description = description;
        this.createdAt = created_At;
    }

    public Categories(String category, String description, String createdAt) {
        this.category = category;
        this.description = description;
        this.createdAt = createdAt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

}
