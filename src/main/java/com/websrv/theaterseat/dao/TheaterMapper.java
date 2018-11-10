package com.websrv.theaterseat.dao;

import java.util.List;
import java.util.Map;

public interface TheaterMapper {
    public List<String> selectTheaterName() throws Exception;
    public List<String> selectRoomNumMap() throws Exception;
    public List<String> selectRoomName(String theaterName) throws Exception;
}
