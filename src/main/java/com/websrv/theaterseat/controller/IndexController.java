package com.websrv.theaterseat.controller;

import com.websrv.theaterseat.dto.BoardDto;
import com.websrv.theaterseat.dto.SeatDto;
import com.websrv.theaterseat.mapper.BoardMapper;
import com.websrv.theaterseat.mapper.MemberMapper;
import com.websrv.theaterseat.mapper.RoomMapper;
import com.websrv.theaterseat.mapper.TheaterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class IndexController {

    /**
     * 해당 Url과 jsp 뷰 페이지를 매핑해주는 컨트롤러
     */

    @Autowired
    TheaterMapper theaterMapper;

    @Autowired
    RoomMapper roomMapper;

    @Autowired
    BoardMapper boardMapper;

    @Autowired
    MemberMapper memberMapper;

    @RequestMapping("/")
    public String index(Model model) throws Exception {
        // t_idx에 해당하는 r_idx 리스트 매핑
        Map<String, List<String>> theaterMap = new HashMap<String, List<String>>();
        // r_idx에 해당하는 roomName 매핑
        Map<String, String> roomMap = new HashMap<String, String>();

        List<String> theaterNameList = theaterMapper.selectAllTheaterName();    // 모든 영화관 이름 리스트로 저장
        List<String> roomNameList = theaterMapper.selectAllRoomName();          // 모든 상영관 이름 리스트로 저장

        for (int i = 0; i < theaterNameList.size(); i++) {
            theaterMap.put(theaterNameList.get(i), theaterMapper.selectRoomIdx(String.valueOf(i + 1)));    // 영화관에 소속된 r_idx 리스트를 영화관에 매핑
        }

        for (int i = 0; i < roomNameList.size(); i++) {
            roomMap.put(String.valueOf(i + 1), roomNameList.get(i));             // 상영관 idx에 상영관 이름 매핑
        }
        model.addAttribute("roomMapper", roomMapper);
        model.addAttribute("theaterNameList", theaterNameList);
        model.addAttribute("theaterMap", theaterMap);
        model.addAttribute("roomMap", roomMap);
        return "main";
    }

    @RequestMapping("/signup")
    public String signup(HttpSession session, Model model) throws Exception {
        return "signup";
    }

    @RequestMapping("/login")
    public String login(HttpSession session, Model mode) throws Exception {
        if(session.getAttribute("id")!=null) {
            return "hello";
        } else {
            return "login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session, Model model) throws Exception {
        session.invalidate();
        return "login";
    }

    //상영관 좌석정보 매핑
    @GetMapping("/room/{r_idx}")
    public String roomNum(Model model, @PathVariable String r_idx) throws Exception {

        //r_idx에 해당하는 좌석의 정보를 가진 객체 리스트
        List<SeatDto> seatDto = roomMapper.selectAllSeats(r_idx);

        //jsp 페이지에 영화관 좌석 테이블을 그리기 위한 최대 열, 좌석 설정
        int maxNum = roomMapper.selectMaxNum(r_idx);
        char maxRow = roomMapper.selectMaxRow(r_idx);

        model.addAttribute("seatDto", seatDto);
        model.addAttribute("maxNum", maxNum);
        model.addAttribute("maxRow", maxRow);
        model.addAttribute("r_idx", r_idx);
        model.addAttribute("roomMapper", roomMapper);
        model.addAttribute("theaterName", roomMapper.selectTheaterName(r_idx));
        model.addAttribute("roomName", roomMapper.selectRoomName(r_idx));

        return "room";
    }

    //각각의 좌석 게시판 매핑
    @GetMapping("/seat/{s_idx}")
    public String seat(Model model, @PathVariable String s_idx) throws Exception {
        List<BoardDto> boardDtoList = boardMapper.selectAllBoard(s_idx);
        model.addAttribute("s_idx",s_idx);
        model.addAttribute("boardDtoList",boardDtoList);
        model.addAttribute("roomName",roomMapper.selectRoomNameByS_Idx(s_idx));
        model.addAttribute("seatRow",roomMapper.selectSeat(s_idx).getSeatRow());
        model.addAttribute("seatNum",roomMapper.selectSeat(s_idx).getSeatNum());
        model.addAttribute("ratingAvg", boardMapper.selectRatingAvg(s_idx));
        model.addAttribute("memberMapper",memberMapper);
        return "seat";
    }


    @RequestMapping("/hello")
    public String hello() throws Exception {

        return "hello";
    }

}
