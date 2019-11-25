package com.javaweb.model;

public class Category {
    public int cutId;
    public String cut;
    public int upcutId;
    public String upcut;
    public String cutDescribe;

    public int getCutId() {
        return cutId;
    }

    public void setCutId(int cutId) {
        this.cutId = cutId;
    }

    public String getCut() {
        return cut;
    }

    public void setCut(String cut) {
        this.cut = cut;
    }

    public int getUpcutId() {
        return upcutId;
    }

    public void setUpcutId(int upcutId) {
        this.upcutId = upcutId;
    }

    public String getUpcut() {
        return upcut;
    }

    public void setUpcut(String upcut) {
        this.upcut = upcut;
    }

    public String getCutDescribe() {
        return cutDescribe;
    }

    public void setCutDescribe(String cutDescribe) {
        this.cutDescribe = cutDescribe;
    }
}
