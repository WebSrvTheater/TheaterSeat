package com.websrv.theaterseat.controller;

import com.websrv.theaterseat.dto.SeatDto;
import com.websrv.theaterseat.mapper.SeatMapper;
import com.websrv.theaterseat.mapper.TheaterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
public class IndexController {

    @Autowired
    TheaterMapper theaterMapper;

    @Autowired
    SeatMapper seatMapper;

    @RequestMapping("/")
    public String index(Model model) throws Exception{
        // t_idx에 해당하는 r_idx 리스트 매핑
        Map <String, List<String>> theaterMap = new HashMap<String, List<String>>();
        // r_idx에 해당하는 roomName 매핑
        Map <String, String> roomMap = new HashMap<String, String>();

        List<String> theaterNameList = theaterMapper.selectAllTheaterName();
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
    public String roomNum(Model model, @PathVariable String r_idx) throws Exception{
        //PrintWriter out = res.getWriter();

        List<SeatDto> seatDto = seatMapper.selectAllSeats(r_idx);

        int maxNum = seatMapper.selectMaxNum(r_idx);
        char maxRow = seatMapper.selectMaxRow(r_idx);

        model.addAttribute("seatDto", seatDto);
        model.addAttribute("maxNum",maxNum);
        model.addAttribute("maxRow",maxRow);
        model.addAttribute("r_idx",r_idx);
        model.addAttribute("seatMapper",seatMapper);
        model.addAttribute("theaterName",seatMapper.selectTheaterName(r_idx));
        model.addAttribute("roomName",seatMapper.selectRoomName(r_idx));

        return "room";
    }

    @RequestMapping("/seat")
    public String seat(Model model) throws Exception{
        return "seat";
    }
}
