package com.websrv.theaterseat.controller;

import com.websrv.theaterseat.dto.BoardDto;
import com.websrv.theaterseat.mapper.BoardMapper;
import com.websrv.theaterseat.service.BoardService;
import com.websrv.theaterseat.view.ResultView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    BoardService boardService;

    @ResponseBody
    @PostMapping(value = "/writing", produces = "application/json")
    public ResultView createContent(HttpSession session, @RequestBody BoardDto boardDto) {
        try{
            return boardService.createContent(session, boardDto);
        }catch (Exception e){
            throw e;
        }
    }

    @ResponseBody
    @PostMapping(value = "/reading", produces = "application/json")
    public ResultView selectAllBoard(HttpSession session, @RequestBody BoardDto boardDto) {
        try{
            return boardService.selectAllBoard(session, boardDto);
        }catch(Exception e){
            throw e;
        }
    }

}
