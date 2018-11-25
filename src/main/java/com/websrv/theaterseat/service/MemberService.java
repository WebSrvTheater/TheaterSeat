package com.websrv.theaterseat.service;

import com.websrv.theaterseat.dto.MemberDto;
import com.websrv.theaterseat.mapper.MemberMapper;
import com.websrv.theaterseat.view.ResultView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Service("memberService")
public class MemberService {
    /**
     * 회원 부가기능 정의
     */
    @Autowired
    private MemberMapper memberMapper;

    public ResultView createMember(MemberDto memberDto){
        //중복된 ID가 있는지 여부 검사, 있을 경우만 회원 가입
        try{
            if(!memberMapper.findDuplicatedId(memberDto.getUserId())){
                memberMapper.insertMember(memberDto);
                return new ResultView("200","회원가입을 완료하였습니다.");
            } else return new ResultView("501", "이미 존재하는 아이디입니다.");
        } catch(Exception e){System.out.println(memberDto.getUserPw());e.printStackTrace(); return new ResultView("500","Internel Server Error");}
    }

    public ResultView chkMember(HttpSession session, MemberDto memberDto){
        //해당하는 계정 정보가 있는지 여부 검사, 있을 시만 로그인.
        try {
            if (memberMapper.loginCheck(memberDto)) {
                session.setAttribute("id", memberDto.getUserId());
                return new ResultView("200", "success");
            } else return new ResultView("501", "해당하는 회원정보가 없습니다.");
        }catch(Exception e){e.printStackTrace();return new ResultView("500","Internal Server Error");}
    }
}
