package com.websrv.theaterseat.mapper;

import com.websrv.theaterseat.dto.BoardDto;

import java.util.List;

public interface BoardMapper {

    public List<BoardDto> insertBoard(BoardDto boardDto);

}
