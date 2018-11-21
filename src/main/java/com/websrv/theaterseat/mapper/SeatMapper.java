package com.websrv.theaterseat.mapper;

import com.websrv.theaterseat.dto.SeatDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SeatMapper {
    public List<SeatDto> selectAllSeats(String r_idx) throws Exception;
    public char selectMaxRow(String r_idx);
    public int selectMaxNum(String r_idx);
    public boolean isSeatExist(@Param("seatRow") char seatRow, @Param("seatNum") int seatNum, @Param("r_idx") String r_idx);
    public boolean isHallWay(@Param("r_idx") String r_idx, @Param("seatNum") int seatNum);
    public String selectTheaterName(String r_idx) throws Exception;
    public String selectRoomName(String r_idx) throws Exception;
}
