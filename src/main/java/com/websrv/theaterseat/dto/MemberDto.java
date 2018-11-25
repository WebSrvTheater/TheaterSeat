package com.websrv.theaterseat.dto;

public class MemberDto {

    private String m_idx;
    private String userId;
    private String userPw;

    public String getM_idx() { return m_idx; }

    public void setM_idx(String m_idx) { this.m_idx = m_idx; }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }


}
