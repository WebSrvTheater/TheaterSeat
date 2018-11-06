package com.websrv.theaterseat.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

public class MemberDTO {

    private String username;

    public String getName() {
        return username;
    }

    public void setName(String username) {
        this.username = username;
    }

}
