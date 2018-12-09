package com.websrv.theaterseat.service;

import com.websrv.theaterseat.dto.BoardDto;
import com.websrv.theaterseat.mapper.BoardMapper;
import com.websrv.theaterseat.view.ResultView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service("boardService")
public class BoardService {

    @Autowired
    private BoardMapper boardMapper;

    public ResultView createContent(HttpSession session, BoardDto boardDto){
        try{
            if(session.getAttribute("m_idx") != null){
                boardMapper.insertBoard(boardDto);
                return new ResultView("200", "저장되었습니다.");
            }else{
                return new ResultView("401", "로그인이 필요합니다.");
            }
        }catch(Exception e){e.printStackTrace();return new ResultView("500", "Internal Server Error");}
    }

    public ResultView deleteContent(int b_idx){
        try{
            boardMapper.deleteBoard(b_idx);
            return new ResultView("200", "삭제되었습니다.");
        }catch(Exception e){e.printStackTrace();return new ResultView("500","Internal Server Error");}
    }
}
