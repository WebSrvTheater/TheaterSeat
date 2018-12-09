package com.websrv.theaterseat.mapper;

import com.websrv.theaterseat.dto.BoardDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BoardMapper {

    public void insertBoard(BoardDto boardDto);

    public List<BoardDto> selectAllBoard(String s_idx) throws Exception;

    public boolean isContentExist(@Param("s_idx") int s_idx, @Param("m_idx") String m_idx);

}
