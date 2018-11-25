package com.websrv.theaterseat.controller;

import com.websrv.theaterseat.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("board")
public class BoardController {

    @Autowired
    BoardMapper boardMapper;

    @ResponseBody
    @PostMapping(value = "/writing", produces = "application/json")
    public

}
