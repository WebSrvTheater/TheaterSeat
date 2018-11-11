package com.websrv.theaterseat.controller;

import com.websrv.theaterseat.mapper.TheaterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.*;

import static java.lang.System.out;

@Controller
public class IndexController {

    @Autowired
    TheaterMapper theaterMapper;

    @RequestMapping("/")
    public String index(Model model) throws Exception{
        // t_idx에 해당하는 r_idx 리스트 매핑
        Map <String, List<String>> theaterMap = new HashMap<String, List<String>>();
        // r_idx에 해당하는 roomName 매핑
        Map <String, String> roomMap = new HashMap<String, String>();

        List<String> theaterNameList = theaterMapper.selectTheaterName();
        List<String> roomNameList = theaterMapper.selectAllRoomName();

        for(int i=0;i<theaterNameList.size();i++){
            theaterMap.put(theaterNameList.get(i),theaterMapper.selectRoomIdx(String.valueOf(i+1)));
        }

        for(int i=0;i<roomNameList.size();i++){
            roomMap.put(String.valueOf(i+1) , roomNameList.get(i));
        }

        model.addAttribute("theaterNameList",theaterNameList);
        model.addAttribute("theaterMap", theaterMap);
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

    @RequestMapping("/room/{r_idx}")
    public void roomNum(HttpServletRequest req, HttpServletResponse res, @PathVariable String r_idx) throws Exception{
        PrintWriter out = res.getWriter();

        Map<String, List<String>> seatMap = new HashMap<String, List<String>>();
        List<String> seatRows = theaterMapper.selectSeatRows(r_idx);

        for(int i=0;i<seatRows.size();i++){
            String seatRow = seatRows.get(i);
            seatMap.put(seatRow, theaterMapper.selectSeatNums(seatRow,r_idx));
        }
        for(int i=0; i<seatRows.size(); i++){
            out.println(seatMap.get(seatRows.get(i)));
        }
    }
}
