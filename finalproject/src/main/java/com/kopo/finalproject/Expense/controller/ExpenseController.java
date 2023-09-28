package com.kopo.finalproject.Expense.controller;

import com.kopo.finalproject.Expense.model.dto.*;
import com.kopo.finalproject.Expense.service.ExpenseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ExpenseController {

    private final ExpenseService expenseService;

    @Autowired
    public ExpenseController(ExpenseService expenseService) {
        this.expenseService = expenseService;
    }

    @RequestMapping("/checkMyExpensePattern")
    public ModelAndView checkMyExpansePattern() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("checkMyExpensePattern");
        return mav;
    }

    @GetMapping("/getExpenseChartData")
    @ResponseBody
    public List<ExpenseChartData> getExpenseChartData(@RequestParam("cardID") String cardID, HttpServletRequest request) {
        System.out.println("이 메서드 호출");
        HttpSession session = request.getSession();
        String memberID = (String) session.getAttribute("memberID");
        List<ExpenseChartData> chartData = expenseService.getExpenseChartData(cardID, memberID);
        System.out.println("차트 데이터" + chartData);
        return chartData;

    }

    @GetMapping("/checkMyExpenseData")
    public ResponseEntity<Map<String, Object>> checkMyExpenseData(@RequestParam("cardID") String cardID) {
        // cardID를 사용하여 쿼리 실행 및 결과 가져오기
        ExpenseMaxCountCategory topCategory = expenseService.getTopCategory(cardID);
        ExpenseMaxSumCategory topAmount = expenseService.getTopAmount(cardID);
        TotalExpenseAmount totalExpenseAmount = expenseService.getTotalExpenseAmount(cardID);
        SubCategory deatailTopCategory = expenseService.getTopCategoryDetailedExpenseCategory(cardID);
        SubCategory deatailTopAmount = expenseService.getTopAmountDetailedExpenseCategory(cardID);
        SubCategory topCategorySubCategoryDescription = expenseService.getTopCategoryDetailedExpenseCategory(cardID);
        SubCategory topAmountSubCategoryDescription = expenseService.getTopAmountDetailedExpenseCategory(cardID);


        // 결과를 Map으로 묶어 JSON 형태로 반환
        Map<String, Object> response = new HashMap<>();
        response.put("topCategory", topCategory);
        response.put("topAmount", topAmount);
        response.put("totalExpenseAmount", totalExpenseAmount);
        response.put("deatailTopCategory", deatailTopCategory);
        response.put("deatailTopAmount", deatailTopAmount);
        response.put("topCategorySubCategoryDescription", topCategorySubCategoryDescription);
        response.put("topAmountSubCategoryDescription", topAmountSubCategoryDescription);


        // 데이터 확인을 위한 출력
        System.out.println("topCategory: " + topCategory.toString());
        System.out.println("topAmount: " + topAmount.toString());
        System.out.println("totalExpenseAmount: " + totalExpenseAmount.toString());
        System.out.println("deatailTopCategory: " + deatailTopCategory.toString());
        System.out.println("deatailTopAmount: " + deatailTopAmount.toString());
        System.out.println("topCategorySubCategoryDescription: " + topCategorySubCategoryDescription.toString());
        System.out.println("topAmountSubCategoryDescription: " + topAmountSubCategoryDescription.toString());

        return ResponseEntity.ok(response);
    }


//    @RequestMapping("/checkMyExpensePattern")
//    public ModelAndView checkMyExpensePattern(
//            @RequestParam("topCategory") String topCategory,
//            @RequestParam("categoryCount") int categoryCount,
//            @RequestParam("topAmount") String topAmount,
//            @RequestParam("totalAmount") int totalAmount,
//            @RequestParam("totalExpenseAmount") int totalExpenseAmount) {
//
//        // ModelAndView에 데이터 추가
//        ModelAndView modelAndView = new ModelAndView("checkMyExpensePattern"); // JSP 페이지 이름
//        modelAndView.addObject("topCategory", topCategory);
//        modelAndView.addObject("categoryCount", categoryCount);
//        modelAndView.addObject("topAmount", topAmount);
//        modelAndView.addObject("totalAmount", totalAmount);
//        modelAndView.addObject("totalExpenseAmount", totalExpenseAmount);
//
//        return modelAndView;
//    }

    @PostMapping("/getExpenseCategoryTagInfo")
    @ResponseBody
    public String getExpenseCategoryTagInfo(@RequestParam String categoryRepresentativePriceTmp, @RequestParam String categoryImgTmp) {
        // categoryRepresentativePriceTmp와 categoryImgTmp를 사용하여 원하는 처리를 수행합니다.

        // 예를 들어, 처리 결과를 문자열로 반환합니다.
        return "Category Tag Info for: " + categoryRepresentativePriceTmp + ", " + categoryImgTmp;
    }

    @PostMapping("/getExpenseAmountTagInfo")
    @ResponseBody
    public String getExpenseAmountTagInfo(@RequestParam String amountRepresentativePriceTmp, @RequestParam String amountImgTmp) {
        // amountRepresentativePriceTmp와 amountImgTmp를 사용하여 원하는 처리를 수행합니다.

        // 예를 들어, 처리 결과를 문자열로 반환합니다.
        return "Amount Tag Info for: " + amountRepresentativePriceTmp + ", " + amountImgTmp;
    }
}
