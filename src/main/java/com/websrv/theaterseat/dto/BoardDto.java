package com.websrv.theaterseat.dto;

public class BoardDto {

    private int s_idx;
    private String content;
    private int m_idx;
    private String userId;
    private int b_idx;
    private double rating;

    public int getS_idx() {  return s_idx;   }

    public void setS_idx(int s_idx) {  this.s_idx = s_idx; }

    public String getContent() {  return content;   }

    public void setContent(String contents) {  this.content = contents;  }

    public int getM_idx() {   return m_idx;   }

    public void setM_idx(int m_idx) { this.m_idx = m_idx;  }

    public String getUserId() {return userId;}

    public void setUserId(String userId) {this.userId = userId;}

    public int getB_idx() {  return b_idx; }

    public void setB_idx(int b_idx) {  this.b_idx = b_idx;  }

    public double getRating() {  return rating;  }

    public void setRating(double rating) {  this.rating = rating;  }
}
