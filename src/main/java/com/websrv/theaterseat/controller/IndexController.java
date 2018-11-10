package com.websrv.theaterseat.controller;

import com.websrv.theaterseat.dao.MemberMapper;
import com.websrv.theaterseat.dao.TheaterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class IndexController {

    @Autowired
    TheaterMapper theaterMapper;

    @RequestMapping("/")
    public String index(Model model) throws Exception{
        Map <String, List<String>> theaterMap = new HashMap<String, List<String>>();
        Map <String, String> roomMap = new HashMap<String, String>();
        List<String> theaterName = theaterMapper.selectTheaterName();
        List<String> roomName = theaterMapper.selectRoomNumMap();
        for(int i=0;i<roomName.size();i++){
            roomMap.put(String.valueOf(i+1) , roomName.get(i));
        }
        for(int i=0;i<theaterName.size();i++){
            theaterMap.put(theaterName.get(i),theaterMapper.selectRoomName(theaterName.get(i)));
        }
        System.out.println(roomMap);
        model.addAttribute("theaterMap", theaterMap);
        model.addAttribute("theaterName",theaterName);
        model.addAttribute("roomMap",roomMap);
        return "main";
    }

    @RequestMapping("/signup")
    public String signup(Model model) throws Exception{

        return "signup";
    }
    @RequestMapping("/login")
    public String login(Model mode) throws Exception{
        return "login";
    }

    @ResponseBody
    @RequestMapping("/room/{roomNum}")
    public String roomNum(Model model, @PathVariable int roomNum) throws Exception{
        return "hello"+roomNum;
    }
}
