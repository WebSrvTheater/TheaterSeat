package com.websrv.theaterseat.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TheaterMapper {
    public List<String> selectAllTheaterName() throws Exception;
    public List<String> selectAllRoomName() throws Exception;
    public List<String> selectRoomIdx(String t_idx) throws Exception;
}
