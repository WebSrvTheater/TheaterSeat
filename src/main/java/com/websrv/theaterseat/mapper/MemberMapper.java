package com.websrv.theaterseat.mapper;

import com.websrv.theaterseat.dto.MemberDto;

import java.util.List;

public interface MemberMapper {
    public List<MemberDto> selectMemberList() throws Exception;
    public int insertMember(MemberDto memberDto);
    public int deleteMember(String id);
    public boolean findDuplicatedId(String userId);
    public boolean loginCheck(MemberDto memberDto);
}
