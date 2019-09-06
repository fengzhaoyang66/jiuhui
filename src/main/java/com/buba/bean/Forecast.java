package com.buba.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Forecast {
    private int id;
    private String planName;
    private int planNumberTables;
    @JsonFormat(pattern= "yyyy-MM-dd HH:mm:ss")
    private Date startTtime;
    @JsonFormat(pattern= "yyyy-MM-dd HH:mm:ss")
    private Date endTime;
    @JsonFormat(pattern= "yyyy-MM-dd HH:mm:ss")
    private Date entryTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlanName() {
        return planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    public int getPlanNumberTables() {
        return planNumberTables;
    }

    public void setPlanNumberTables(int planNumberTables) {
        this.planNumberTables = planNumberTables;
    }

    public Date getStartTtime() {
        return startTtime;
    }

    public void setStartTtime(Date startTtime) {
        this.startTtime = startTtime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getEntryTime() {
        return entryTime;
    }

    public void setEntryTime(Date entryTime) {
        this.entryTime = entryTime;
    }
}
