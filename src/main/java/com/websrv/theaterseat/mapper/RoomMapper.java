package com.websrv.theaterseat.mapper;

import com.websrv.theaterseat.dto.SeatDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoomMapper {
    /* 다수의 파라미터를 받아야 할 시 @Param 어노테이션 사용, mapper.xml 파일에 parameterType=map으로 기재 */
    public List<SeatDto> selectAllSeats(String r_idx) throws Exception; //모든 좌석을 seatDto형으로 받아 List에 저장
    public char selectMaxRow(String r_idx); //최대 행 리턴
    public int selectMaxNum(String r_idx);  //최대 열 리턴
    public boolean isSeatExist(@Param("seatRow") char seatRow, @Param("seatNum") int seatNum, @Param("r_idx") String r_idx);    //해당 좌석이 있는지 여부 리턴
    public boolean isHallWay(@Param("r_idx") String r_idx, @Param("seatNum") int seatNum);  //이 좌석의 오른쪽이 복도인지 여부 리턴
    public String selectTheaterName(String r_idx) throws Exception; //r_idx에 해당하는 영화관 이름 리턴
    public String selectRoomName(String r_idx) throws Exception;    //r_idx에 해당하는 상영관 이름 리턴
    public String selectRoomNameByS_Idx(String s_idx) throws Exception;
    public SeatDto selectSeat(String s_idx) throws Exception;
}
