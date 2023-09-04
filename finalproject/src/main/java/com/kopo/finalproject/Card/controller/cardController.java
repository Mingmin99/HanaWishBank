package com.kopo.finalproject.Card.controller;

import com.kopo.finalproject.Card.model.dto.Card;
import com.kopo.finalproject.Card.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class cardController {

    private final CardService cardService;

    @Autowired
    public cardController(CardService cardService) {
        this.cardService = cardService;
    }


    @RequestMapping("/checkMyCard")
    public String checkMyCard(Model model, HttpSession session) {
        String memberID = (String) session.getAttribute("memberID");

        if (memberID == null || memberID.isEmpty()) {
            // memberID가 없는 경우 또는 비어있는 경우에 대한 처리
            return "redirect:/login"; // 로그인 페이지로 리다이렉트 또는 다른 처리
        }

        try {
            List<Card> registeredCards = cardService.getRegisteredCardByMemberID(memberID);
            model.addAttribute("registeredCards", registeredCards);
            return "checkMyCard"; // JSP 페이지 이름
        } catch (Exception e) {
            e.printStackTrace();
            // 예외 발생 시 에러 페이지로 리다이렉트 또는 다른 처리
            return "errorPage"; // 에러 페이지로 이동하는 경우
        }
    }
}