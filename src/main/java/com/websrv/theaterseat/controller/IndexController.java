package com.websrv.theaterseat.controller;

import com.websrv.theaterseat.model.MemberDTO;
import com.websrv.theaterseat.model.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private MemberMapper mapper;

    @RequestMapping("/")
    @ResponseBody
    public String index(Model model) throws Exception{

        List<MemberDTO> list = mapper.selectMemberList();

        for(int i=0;i<list.size();i++){
            System.out.println("name : "+list.get(i).getName());
        }

        return "hello";
    }
}
