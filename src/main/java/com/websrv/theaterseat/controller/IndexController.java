package com.websrv.theaterseat.controller;

import com.websrv.theaterseat.dto.SeatDto;
import com.websrv.theaterseat.mapper.SeatMapper;
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

    @Autowired
    SeatMapper seatMapper;

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

        List<SeatDto> seatDto = seatMapper.selectAllSeats(r_idx);

        int maxNum = seatMapper.selectMaxNum(r_idx);
        char maxRow = seatMapper.selectMaxRow(r_idx);

        int temp=0;
        out.println("<table>");
        for(char i='A';i<=maxRow;i++){
            out.println("<tr>");
            for(int j=0;j<=maxNum;j++){
                out.print("<td>");
                if(seatMapper.isSeatExist(i,j,r_idx)){
                    out.print(seatDto.get(temp++).getS_idx());
                }
                if(seatMapper.isHallWay(r_idx,j)){
                    out.print("<td><pre> </pre>");
                }
            }
            out.println("</tr>");
        }
        out.println("</table>");
    }
}
