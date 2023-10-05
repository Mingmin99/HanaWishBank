package com.kopo.finalproject.HWBMember.controller;

import com.kopo.finalproject.HWBMember.model.dto.HWBMember;
import com.kopo.finalproject.HWBMember.model.dto.TransferRecord;
import com.kopo.finalproject.HWBMember.service.HWBMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping("/introduce")
    public ModelAndView introduce() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("introduce");
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

//
//    @GetMapping(value = "/logout")
//    public ModelAndView deleteMember(HttpServletRequest request) {
//        HttpSession session = request.getSession(false);
//        ModelAndView mav = new ModelAndView();
//        if (session != null) {
//            session.invalidate();
//        }
//        mav.addObject("msg", "로그아웃 성공");
//        mav.addObject("loc", "/");
//        mav.setViewName("/message");
//        return mav;
//    }

    @GetMapping(value = "/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // 세션 만료
        }
        return "redirect:/"; // "/index"로 리다이렉트
    }

    @RequestMapping("/register")
    public ModelAndView register() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("register");
        return mav;
    }

    @RequestMapping("/myPage")
    public ModelAndView myPage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("myPage");
        return mav;
    }

    //    @GetMapping(value = "/getHWBMemberInfoByID")
//    public ModelAndView getHWBMemberInfoByID(HttpServletRequest request) {
//        HttpSession session = request.getSession(false); // 세션이 없을 경우 null 반환
//
//        if (session == null || session.getAttribute("memberID") == null) {
//            // 세션이 없거나 memberID가 없을 경우 /login으로 리다이렉트
//            return new ModelAndView("redirect:/login");
//        }
//        ModelAndView mav = new ModelAndView("/myPage");
//        String memberID = (String) session.getAttribute("memberID");
//        HWBMember memberInfo = hwbMemberService.getHWBMemberInfoByID(memberID);
//        mav.addObject("memberInfo", memberInfo);
//        System.out.println("이거 마이페이지 멤버 정보 " + memberInfo);
//        return mav;
//    }
    @GetMapping(value = "/getHWBMemberInfoByID")
    @ResponseBody
    public HWBMember getHWBMemberInfoByID(HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("memberID") == null) {
            // 세션이 없거나 memberID가 없을 경우 null 반환
            return null;
        }

        String memberID = (String) session.getAttribute("memberID");
        HWBMember memberInfo = hwbMemberService.getHWBMemberInfoByID(memberID);
        System.out.println(memberInfo);
        return memberInfo;
    }

    @GetMapping("/getCounts")
    public ResponseEntity<Map<String, Integer>> getCounts(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String memberID = (String) session.getAttribute("memberID");
        HWBMember memberInfo = hwbMemberService.getHWBMemberInfoByID(memberID);
        int wishListItemCount = hwbMemberService.getCountWishListItemByID(memberID);
        int purchasePlanCount = hwbMemberService.getCountPurchasePlanListItemByID(memberID);
        int challengeSavingsCount = hwbMemberService.getCountChallengeSavingsByID(memberID);

        Map<String, Integer> counts = new HashMap<>();
        counts.put("wishListItemCount", wishListItemCount);
        counts.put("purchasePlanCount", purchasePlanCount);
        counts.put("challengeSavingsCount", challengeSavingsCount);

        return ResponseEntity.ok(counts);
    }

    @GetMapping("/getTransferRecordByID")
    @ResponseBody
    public List<TransferRecord> getTransferRecordByID(HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("memberID") == null) {
            // 세션이 없거나 memberID가 없을 경우 null 반환
            return null;
        }

        String memberID = (String) session.getAttribute("memberID");
        List<TransferRecord> transferRecords = hwbMemberService.getTransferRecordByID(memberID);
        System.out.println("이거 거래내역 " + transferRecords);

        return transferRecords;
    }
}

