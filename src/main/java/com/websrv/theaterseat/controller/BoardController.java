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
    public ResultView createWriting(HttpSession session, @RequestBody BoardDto boardDto) {
        try{
            return boardService.createWriting(session, boardDto);
        }catch (Exception e){
            throw e;
        }
    }

}
