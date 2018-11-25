package com.websrv.theaterseat.mapper;

import com.websrv.theaterseat.dto.MemberDto;

import java.util.List;

public interface MemberMapper {
    public List<MemberDto> selectMemberList() throws Exception; //모든 회원 리스트 리턴
    public void insertMember(MemberDto memberDto);               //회원 가입
    public void deleteMember(String id);                         //회원 탈퇴
    public boolean findDuplicatedId(String userId);             //중복되는 Id 여부 리턴
    public List<MemberDto> loginCheck(MemberDto memberDto);             //해당하는 회원 여부 리턴
}
