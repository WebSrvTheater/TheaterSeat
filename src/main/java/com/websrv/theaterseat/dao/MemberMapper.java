package com.websrv.theaterseat.dao;

import java.util.HashMap;
import java.util.List;

public interface MemberMapper {
    public List<MemberDao> selectMemberList() throws Exception;
    public int insertMember(MemberDao memberDAO);
    public int deleteMember(String id);
    public boolean findDuplicatedId(String userId);
}
