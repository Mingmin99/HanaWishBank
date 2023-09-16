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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
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
    public ResponseEntity<Map<String, Object>> deletePurchasePlanList(@RequestBody List<String> selectedIds) {
        Map<String, Object> response = new HashMap<>();

        try {
            purchasePlanListService.deletePurchasePlanList(selectedIds);
            response.put("success", true);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "삭제 중 오류가 발생했습니다.");
        }

        return ResponseEntity.ok(response);
    }

    @GetMapping("/goMakeAccount")
    public ModelAndView registerMyPaymentPlan(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("registerMyPaymentPlan");

        try {
            // 선택된 purchasePlanID 값을 직접 추출
            String[] selectedIdsArray = request.getParameterValues("selectedIds");
            List<String> selectedIds = Arrays.asList(selectedIdsArray);
            System.out.println("이거는 선택된 아이템 아이디 값들 selectedIds " + selectedIds);

            // 선택된 purchasePlanID 값을 이용하여 데이터를 조회
            List<PurchasePlanListItem> selectedPlans = purchasePlanListService.getPurchasePlansByIds(selectedIds);
            System.out.println("이거는 선택된 아이템들 selectedPlans " + selectedPlans);
            mav.addObject("selectedPlans", selectedPlans);

            return mav;
        } catch (Exception e) {
            // 오류 처리 로직 추가
            mav.addObject("error", "데이터 조회 중 오류가 발생했습니다.");
            return mav;
        }
    }
//    @GetMapping("/goMakeAccount")
//    public ModelAndView registerMyPaymentPlan(HttpServletRequest request) {
//        ModelAndView mav = new ModelAndView("registerMyPaymentPlan");
//
//        try {
//            // 선택된 purchasePlanID 값을 직접 추출
//            String[] selectedIdsArray = request.getParameterValues("selectedIds");
//            List<String> selectedIds = Arrays.asList(selectedIdsArray);
//            System.out.println("이거는 선택된 아이템 아이디 값들 selectedIds " + selectedIds);
//
//            // 선택된 purchasePlanID 값을 이용하여 데이터를 조회하고 매핑
//            Map<String, PurchasePlanListItem> selectedPlansMap = new HashMap<>();
//            List<PurchasePlanListItem> selectedPlans = new ArrayList<>();
//
//            for (String id : selectedIds) {
//                PurchasePlanListItem plan = purchasePlanListService.getPurchasePlansByIds(id);
//                selectedPlansMap.put(id, plan);
//                selectedPlans.add(plan);
//            }
//
//            // HashMap을 ModelAndView에 추가
//            mav.addObject("selectedPlansMap", selectedPlansMap);
//            mav.addObject("selectedPlans", selectedPlans);
//
//            return mav;
//        } catch (Exception e) {
//            // 오류 처리 로직 추가
//            mav.addObject("error", "데이터 조회 중 오류가 발생했습니다.");
//            return mav;
//        }
//    }

}





