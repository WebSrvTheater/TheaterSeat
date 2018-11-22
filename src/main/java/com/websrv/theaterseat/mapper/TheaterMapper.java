package com.websrv.theaterseat.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TheaterMapper {
    public List<String> selectAllTheaterName() throws Exception;    //모든 영화관 이름 리턴
    public List<String> selectAllRoomName() throws Exception;       //모든 상영관 이름 리턴
    public List<String> selectRoomIdx(String t_idx) throws Exception; //해당 영화관 내의 상영관 리스트 리턴.
}
