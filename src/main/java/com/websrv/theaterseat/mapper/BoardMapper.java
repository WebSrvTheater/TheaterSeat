package com.websrv.theaterseat.mapper;

import com.websrv.theaterseat.dto.BoardDto;

import java.util.List;

public interface BoardMapper {

    public void insertBoard(BoardDto boardDto);

    public List<BoardDto> selectAllBoard(String s_idx) throws Exception;

}
