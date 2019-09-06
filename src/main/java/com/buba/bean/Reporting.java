package com.buba.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


public class Reporting {
    private int id;
    private int actualTableCount;
    private int newCustomers;
    private int oldCustomers;
    private int intentionalCustomers;
    private Double premium;
    @JsonFormat(pattern= "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date activityTime;

    @Override
    public String toString() {
        return "Reporting{" +
                "id=" + id +
                ", actualTableCount=" + actualTableCount +
                ", newCustomers=" + newCustomers +
                ", oldCustomers=" + oldCustomers +
                ", intentionalCustomers=" + intentionalCustomers +
                ", premium=" + premium +
                ", activityTime=" + activityTime +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getActualTableCount() {
        return actualTableCount;
    }

    public void setActualTableCount(int actualTableCount) {
        this.actualTableCount = actualTableCount;
    }

    public int getNewCustomers() {
        return newCustomers;
    }

    public void setNewCustomers(int newCustomers) {
        this.newCustomers = newCustomers;
    }

    public int getOldCustomers() {
        return oldCustomers;
    }

    public void setOldCustomers(int oldCustomers) {
        this.oldCustomers = oldCustomers;
    }

    public int getIntentionalCustomers() {
        return intentionalCustomers;
    }

    public void setIntentionalCustomers(int intentionalCustomers) {
        this.intentionalCustomers = intentionalCustomers;
    }

    public Double getPremium() {
        return premium;
    }

    public void setPremium(Double premium) {
        this.premium = premium;
    }

    public Date getActivityTime() {
        return activityTime;
    }

    public void setActivityTime(Date activityTime) {
        this.activityTime = activityTime;
    }
}
