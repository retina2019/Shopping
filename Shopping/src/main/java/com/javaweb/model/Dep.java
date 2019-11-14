package com.javaweb.model;

public class Dep {
    public int depId;
    public String depName;
    public int updepId;
    public String updepName;
    public String depDescribe;
    public String newDate;
    public String closeDate;

    public int getDepId() {
        return depId;
    }

    public void setDepId(int depId) {
        this.depId = depId;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public int getUpdepId() {
        return updepId;
    }

    public void setUpdepId(int updepId) {
        this.updepId = updepId;
    }

    public String getUpdepName() {
        return updepName;
    }

    public void setUpdepName(String updepName) {
        this.updepName = updepName;
    }

    public String getDepDescribe() {
        return depDescribe;
    }

    public void setDepDescribe(String depDescribe) {
        this.depDescribe = depDescribe;
    }

    public String getNewDate() {
        return newDate;
    }

    public void setNewDate(String newDate) {
        this.newDate = newDate;
    }

    public String getCloseDate() {
        return closeDate;
    }

    public void setCloseDate(String closeDate) {
        this.closeDate = closeDate;
    }
}
