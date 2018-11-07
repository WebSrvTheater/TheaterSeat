package com.websrv.theaterseat.service;

import com.websrv.theaterseat.dao.MemberDao;
import com.websrv.theaterseat.dao.MemberMapper;
import com.websrv.theaterseat.view.ResultView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberService {

    @Autowired
    private MemberMapper memberMapper;

    public ResultView createMember(MemberDao memberDao){
        try{
        if(!memberMapper.findDuplicatedId(memberDao.getUserId())){
            memberMapper.insertMember(memberDao);
            return new ResultView("200","회원가입을 완료하였습니다.");
        }
        else return new ResultView("501", "이미 존재하는 아이디입니다.");}
        catch(Exception e){return new ResultView("500","Internel Server Error");}
    }

    public ResultView chkMember(MemberDao memberDao){
        try {
            if (memberMapper.loginCheck(memberDao)) {
                return new ResultView("200", "success");
            } else return new ResultView("501", "해당하는 회원정보가 없습니다.");
        }catch(Exception e){e.printStackTrace();return new ResultView("500","Internal Server Error");
        }
    }
}
