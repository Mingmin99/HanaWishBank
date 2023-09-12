package com.kopo.finalproject.PurchasePlanList.controller;

import com.kopo.finalproject.PurchasePlanList.model.dto.PurchasePlanJoinResult;
import com.kopo.finalproject.PurchasePlanList.model.dto.PurchasePlanListItem;
import com.kopo.finalproject.PurchasePlanList.service.PurchasePlanListService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class purchasePlanListController {

    private final PurchasePlanListService purchasePlanListService;

    public purchasePlanListController(PurchasePlanListService purchasePlanListService) {
        this.purchasePlanListService = purchasePlanListService;
    }


    @RequestMapping("/registerMyPurchasePlanList")
    public ModelAndView registerMyPurchasePlanList() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/registerMyPurchasePlanList");
        return mav;
    }

    @RequestMapping("/checkMyPurchasePlanList")
    public ModelAndView checkMyPurchasePlanList() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/checkMyPurchasePlanList");
        return mav;
    }
    @RequestMapping("/registerMyPaymentPlan")
    public ModelAndView registerMyPaymentPlan() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/registerMyPaymentPlan");
        return mav;
    }

    @PostMapping("/addPurchasePlanListItem")
    @Transactional
    public ResponseEntity<String> addPurchasePlanListItem(@RequestBody PurchasePlanListItem request) {
        try {
            // 서비스를 호출하여 데이터를 DB에 저장
            purchasePlanListService.addPurchasePlanListItem(request);
            return ResponseEntity.ok("데이터 저장 성공");
        } catch (Exception e) {
            // 오류 처리
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("데이터 저장 실패: " + e.getMessage());
        }
    }

    @GetMapping("/getAllPurchasePlanList")
    public ModelAndView getAllPurchasePlanList(HttpSession session) {
        ModelAndView mav = new ModelAndView("/checkMyPurchasePlanList");
        String memberID = (String) session.getAttribute("memberID");
        List<PurchasePlanJoinResult> purchasePlanList = purchasePlanListService.getAllPurchasePlanList(memberID);
        mav.addObject("purchasePlanList", purchasePlanList);
        return mav;
    }

//    @GetMapping("/createAccount")
//    public ModelAndView
}






