package com.websrv.theaterseat.dao;

import com.websrv.theaterseat.view.ResultView;

import java.util.HashMap;
import java.util.List;

public interface MemberMapper {
    public List<MemberDAO> selectMemberList() throws Exception;
    public int insertMember(MemberDAO memberDAO);
    public int deleteMember(String id);
    public HashMap<String, Object> selectOne(String userId);
}
