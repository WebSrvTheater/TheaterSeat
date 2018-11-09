package com.websrv.theaterseat.controller;

import com.websrv.theaterseat.dao.MemberMapper;
import com.websrv.theaterseat.dao.TheaterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

@Controller
public class IndexController {

    @Autowired
    TheaterMapper theaterMapper;

    @RequestMapping("/")
    public String index(Model model) throws Exception{
        Map <String, List<String>> theaterMap = new HashMap<String, List<String>>();
        List<String> theaterName = theaterMapper.selectTheaterName();
        for(int i=0;i<theaterName.size();i++){
            theaterMap.put(theaterName.get(i),theaterMapper.selectRoomName(theaterName.get(i)));
        }
        model.addAttribute("theaterMap", theaterMap);
        model.addAttribute("theaterName",theaterName);
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
}
