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
    /**
     * 회원과 관련된 기능을하는 컨트롤러
     * 모든 기능은 post로 데이터를 전달 받을 시 실행.
     * /member로 들어오는 요청은 공통적으로 이곳에 매핑
     */

    @Autowired
    MemberService memberService;

    //회원가입
    @ResponseBody
    @PostMapping(value = "/signup", produces = "application/json")
    public ResultView createMember(@RequestBody MemberDto memberDto) {
        try {
            //MemberService에 정의된 기능을 실행한 후 해당 정보로 회원 가입
            return memberService.createMember(memberDto);
        } catch (Exception e) {
            throw e;
        }
    }

    //로그인
    @ResponseBody
    @PostMapping(value = "/login", produces = "application/json")
    public ResultView chkMember(@RequestBody MemberDto memberDto) {
        try {
            //MemberService에 정의된 기능을 실행한 후 해당 정보로 로그인
            return memberService.chkMember(memberDto);
        } catch (Exception e) {
            throw e;
        }
    }
}
