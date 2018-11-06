package com.websrv.theaterseat.model;

import java.util.List;

public interface MemberMapper {
    public List<MemberDTO> selectMemberList() throws Exception;
}
