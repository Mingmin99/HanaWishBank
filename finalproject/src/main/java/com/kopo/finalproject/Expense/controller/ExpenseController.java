package com.kopo.finalproject.Expense.controller;

import com.kopo.finalproject.Expense.model.dto.ExpenseMaxCountCategory;
import com.kopo.finalproject.Expense.model.dto.ExpenseMaxSumCategory;
import com.kopo.finalproject.Expense.model.dto.TotalExpenseAmount;
import com.kopo.finalproject.Expense.service.ExpenseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
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

//    @GetMapping("/analysis")
//    @ResponseBody
//    public List<ExpenseAnalysisResult> getExpenseData(@RequestParam("cardID") String cardID) {
//        List<ExpenseAnalysisResult> expenseData = expenseService.getExpenseCategoryTotalAmount(cardID);
//        return expenseData;
//    }

    @GetMapping("/checkMyExpenseData")
    public ResponseEntity<Map<String, Object>> checkMyExpenseData(@RequestParam("cardID") String cardID) {
        // cardID를 사용하여 쿼리 실행 및 결과 가져오기
        ExpenseMaxCountCategory topCategory = expenseService.getTopCategory(cardID);
        ExpenseMaxSumCategory topAmount = expenseService.getTopAmount(cardID);
        TotalExpenseAmount totalExpenseAmount = expenseService.getTotalExpenseAmount(cardID);
//        SubCategory deatailTopCategory = expenseService.getTopCategoryDetailedExpenseCategory(cardID);
//        SubCategory deatailTopAmount = expenseService.getTopAmountDetailedExpenseCategory(cardID);

        // 결과를 Map으로 묶어 JSON 형태로 반환
        Map<String, Object> response = new HashMap<>();
        response.put("topCategory", topCategory);
        response.put("topAmount", topAmount);
        response.put("totalExpenseAmount", totalExpenseAmount);
//        response.put("deatailTopCategory", deatailTopCategory);
//        response.put("deatailTopAmount", deatailTopAmount);

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


}
