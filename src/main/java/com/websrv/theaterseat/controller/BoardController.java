package com.websrv.theaterseat.controller;

import com.websrv.theaterseat.dto.BoardDto;
import com.websrv.theaterseat.mapper.BoardMapper;
import com.websrv.theaterseat.service.BoardService;
import com.websrv.theaterseat.view.ResultView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
    @DeleteMapping(value = "/delete", produces = "application/json")
    public ResultView deleteContent(@RequestParam int b_idx){
        try{
            return boardService.deleteContent(b_idx);
        }catch (Exception e){
            throw e;
        }
    }
}
