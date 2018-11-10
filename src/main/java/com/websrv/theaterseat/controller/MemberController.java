package com.websrv.theaterseat.controller;

import com.websrv.theaterseat.dto.MemberDto;
import com.websrv.theaterseat.service.MemberService;
import com.websrv.theaterseat.view.ResultView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    MemberService memberService;

    @ResponseBody
    @PostMapping(value="/signup", produces="application/json")
    public ResultView createMember(@RequestBody MemberDto memberDto){
        try{
            return memberService.createMember(memberDto);
        }catch(Exception e){
            throw e;
        }
    }

    @ResponseBody
    @PostMapping(value="/login", produces="application/json")
    public ResultView chkMember(@RequestBody MemberDto memberDto) {
        try {
            return memberService.chkMember(memberDto);
        } catch (Exception e) {
            throw e;
        }
    }
}
