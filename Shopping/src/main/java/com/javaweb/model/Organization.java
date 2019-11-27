package com.javaweb.model;

public class Organization {
 private int id;
 private String upcut;
 private String name;
 private boolean open;
 private boolean isParent;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUpcut() {
        return upcut;
    }

    public void setUpcut(String upcut) {
        this.upcut = upcut;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isOpen() {
        return open;
    }

    public void setOpen(boolean open) {
        this.open = open;
    }

    public boolean isParent() {
        return isParent;
    }

    public void setParent(boolean parent) {
        isParent = parent;
    }
}
