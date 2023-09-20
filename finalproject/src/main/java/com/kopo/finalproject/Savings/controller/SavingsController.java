package com.kopo.finalproject.Savings.controller;

import com.kopo.finalproject.Savings.model.dto.Account;
import com.kopo.finalproject.Savings.service.SavingsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class SavingsController {

   private final SavingsService savingsService;

    public SavingsController(SavingsService savingsService) {
        this.savingsService = savingsService;
    }

    @GetMapping("/getAllAccounts")
    @ResponseBody
    public List<Account> getAllAccounts() {
        List<Account> accounts = savingsService.getAllAccounts();
        System.out.println(accounts);
        return accounts;
    }
//    @PostMapping("/insert-payment-plan")
//    public String insertPaymentPlan(@ModelAttribute PaymentPlan paymentPlan, Model model) {
//        // 폼 데이터를 받아서 PaymentPlan 객체로 매핑하고, 서비스를 통해 데이터베이스에 저장
//        savingsService.savePaymentPlan(paymentPlan);
//
//        // 저장 후 리다이렉션 또는 다른 작업 수행
//        return "redirect:/success"; // 저장 성공 페이지로 리다이렉트
//    }
}
