package com.tech.blog.entities;

public class Users {

    private Integer id;
    private String name;
    private String email;
    private String password;
    private String information;
    private String gender;
    private String profileImage;

//    constructors
    public Users() {
    }

    public Users(Integer id, String name, String email, String password, String information, String gender, String profileImage) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.information = information;
        this.gender = gender;
        this.profileImage = profileImage;
    }

    public Users(String name, String email, String password, String information, String gender, String profileImage) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.information = information;
        this.gender = gender;
        this.profileImage = profileImage;
    }

//    getters and setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(String profileImage) {
        this.profileImage = profileImage;
    }
    
    

}
