package com.kopo.finalproject.HWBMember.controller;

import com.kopo.finalproject.HWBMember.model.dto.HWBMember;
import com.kopo.finalproject.HWBMember.service.HWBMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class testController {

    private final HWBMemberService hwbMemberService;

    @Autowired
    public testController(HWBMemberService hwbMemberService) {
        this.hwbMemberService = hwbMemberService;
    }

    @RequestMapping("/")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("index");
        return mav;
    }


    @PostMapping("/login-member")
    public ResponseEntity<String> loginMember(@RequestBody HashMap<String, String> loginData, HttpServletRequest request) {
        HWBMember loginMember = hwbMemberService.loginMember(loginData);
        HttpSession session = request.getSession();
        if (loginMember != null) {
            session.setAttribute("name", loginMember.getName());
            session.setAttribute("memberID", loginMember.getMemberID());
            return ResponseEntity.ok("로그인 성공");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("로그인 실패");
        }
    }

    @RequestMapping("/login")
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("login");
        return mav;
    }


    @GetMapping(value = "/logout")
    public ModelAndView deleteMember(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        ModelAndView mav = new ModelAndView();
        if (session != null) {
            session.invalidate();
        }
        mav.addObject("msg", "로그아웃 성공");
        mav.addObject("loc", "/");
        mav.setViewName("/message");
        return mav;
    }


    @RequestMapping("/register")
    public ModelAndView register() {
        System.out.println("레스게릿붐붐타임");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("register");
        return mav;
    }

}