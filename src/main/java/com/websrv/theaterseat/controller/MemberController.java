package com.websrv.theaterseat.controller;

import com.websrv.theaterseat.dao.MemberDao;
import com.websrv.theaterseat.dao.MemberMapper;
import com.websrv.theaterseat.service.MemberService;
import com.websrv.theaterseat.view.ResultView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/signup")
public class MemberController {

    @Autowired
    MemberService memberService;

    @ResponseBody
    @PostMapping(value="/insert", produces="application/json")
    public ResultView createMember(@RequestBody MemberDao memberDao){
        try{
            return memberService.createMember(memberDao);
        }catch(Exception e){
            throw e;
        }
    }
}
