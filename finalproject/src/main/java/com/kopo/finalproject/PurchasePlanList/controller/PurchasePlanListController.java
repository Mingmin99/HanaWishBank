package com.kopo.finalproject.PurchasePlanList.controller;

import com.kopo.finalproject.PurchasePlanList.model.dto.PurchasePlanJoinResult;
import com.kopo.finalproject.PurchasePlanList.model.dto.PurchasePlanListItem;
import com.kopo.finalproject.PurchasePlanList.service.PurchasePlanListService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @PostMapping("/updatePurchasePlanListInfo")
    @ResponseBody
    public ResponseEntity<Map<String, String>> updatePurchasePlan(@RequestBody PurchasePlanListItem updatedPlan) {
        try {
            System.out.println("업데이트 정보" + updatedPlan);
            // 여기서 updatedPlan을 이용하여 업데이트 로직을 구현합니다.
            purchasePlanListService.updatePurchasePlanListInfo(updatedPlan); // PurchasePlanService에 해당 메서드 구현 필요

            Map<String, String> response = new HashMap<>();
            response.put("message", "업데이트가 성공했습니다.");
            return ResponseEntity.ok().body(response);
        } catch (Exception e) {
            Map<String, String> response = new HashMap<>();
            response.put("message", "업데이트에 실패했습니다.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }
    @PostMapping("/deletePurchasePlanList")
    @ResponseBody
    public ResponseEntity<String> deletePurchasePlanList(@RequestBody String purchasePlanID) {
        try {
            // purchasePlanID를 사용하여 삭제 로직을 구현하고 DB에서 삭제 작업 수행
            purchasePlanListService.deletePurchasePlanList(purchasePlanID);
            return ResponseEntity.ok("삭제가 성공했습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("삭제에 실패했습니다.");
        }
    }


//    @GetMapping("/createAccount")
//    public ModelAndView
}






