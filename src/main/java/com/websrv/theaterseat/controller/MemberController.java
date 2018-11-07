package com.websrv.theaterseat.controller;

import com.websrv.theaterseat.dao.MemberDAO;
import com.websrv.theaterseat.dao.MemberMapper;
import com.websrv.theaterseat.view.ResultView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/signup")
public class MemberController {
    @Autowired
    private MemberMapper mapper;

    @PostMapping(value="/insert", produces="application/json")
    public void createMember(@RequestBody MemberDAO memberDao){
        try{
            mapper.insertMember(memberDao);
        }catch(Exception e){
            throw e;
        }
    }
}
