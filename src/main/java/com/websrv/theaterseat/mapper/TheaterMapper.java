package com.websrv.theaterseat.mapper;

import java.util.List;
import java.util.Map;

public interface TheaterMapper {
    public List<String> selectTheaterName() throws Exception;
    public List<String> selectAllRoomName() throws Exception;
    public List<String> selectRoomIdx(String t_idx) throws Exception;
    public List<String> selectSeatIdx(String r_idx) throws Exception;
}
