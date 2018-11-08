package com.websrv.theaterseat.dao;

import java.util.List;
import java.util.Map;

public interface TheaterMapper {
    public List<Map<String, Object>> selectTheaterAndRoom() throws Exception;
}
