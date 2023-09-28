package com.kopo.finalproject.Savings.controller;

import com.kopo.finalproject.PurchasePlanList.model.dto.SavingPurchasePlan;
import com.kopo.finalproject.PurchasePlanList.service.PurchasePlanListService;
import com.kopo.finalproject.Savings.model.dto.Account;
import com.kopo.finalproject.Savings.model.dto.ChallengeSavings;
import com.kopo.finalproject.Savings.model.dto.PlanItemRatio;
import com.kopo.finalproject.Savings.service.SavingsService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class SavingsController {

    private final SavingsService savingsService;
    private final PurchasePlanListService purchasePlanListService;

    public SavingsController(SavingsService savingsService, PurchasePlanListService purchasePlanListService) {
        this.savingsService = savingsService;
        this.purchasePlanListService = purchasePlanListService;
    }

    @GetMapping("/getAllAccounts")
    @ResponseBody
    public List<Account> getAllAccounts() {
        List<Account> accounts = savingsService.getAllAccounts();
        System.out.println(accounts);
        return accounts;
    }

    @RequestMapping("/checkMyChallengeSavings")
    public ModelAndView checkMyWishList() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("checkMyChallengeSavings");
        return mav;
    }


    @PostMapping("/insertPaymentPlan")
    public String insertPaymentPlan(HttpServletRequest request) {
        //멤버 아이디 가져오기
        HttpSession session = request.getSession();
        String memberID = (String) session.getAttribute("memberID");
        System.out.println("이거 적금 회원 아이디 넣을 거 " + memberID);
        // 폼 데이터에서 필요한 데이터 추출
//        ---------------------------------------------------------------------------------------------------------
        String planName = request.getParameter("planName");
        int targetSavingsPeriod = Integer.parseInt(request.getParameter("goalDuration"));
        int targetSavingsAmount = Integer.parseInt(request.getParameter("goalAmount"));
        String paymentFrequency = request.getParameter("paymentFrequency");
        int paymentDate = Integer.parseInt(request.getParameter("paymentDate"));
        String paymentDay = request.getParameter("paymentDayOfWeek");
        int paymentAmount = Integer.parseInt(request.getParameter("paymentAmount"));
        String transferMethod = request.getParameter("transferMethod");
        long transferAccount = Long.parseLong(request.getParameter("autoTransferAccount"));
        int expectedPrincipal = Integer.parseInt(request.getParameter("expectedPrincipal"));
        int expectedInterest = Integer.parseInt(request.getParameter("expectedInterest"));
        String expirationOption = request.getParameter("terminationMethod");
        long challengeSavingsAccountNumber = Long.parseLong(request.getParameter("challengeSavingsAccountNumber"));
        int challengeSavingsAccountPW = Integer.parseInt(request.getParameter("challengeSavingsAccountPW"));
        // "expectedTerminationDate" 파라미터를 받아옴
        String expectedTerminationDateStr = request.getParameter("expectedTerminationDate");
        System.out.println("날짜 받아와야 하는 거 " + expectedTerminationDateStr);

        // 날짜 형식 지정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date endDay = null;

        try {
            // 문자열을 Date로 파싱
            endDay = dateFormat.parse(expectedTerminationDateStr);
            System.out.println(endDay);
        } catch (ParseException e) {
            // 날짜 파싱 오류 처리
            e.printStackTrace();
            // 예외 처리 추가
            // 날짜 파싱에 실패한 경우 어떻게 처리할지 여기에 작성
            // 예를 들어 기본값을 설정하거나 오류 메시지를 사용자에게 표시하는 등의 처리
        }

        // ChallengeSavings 객체 생성
        ChallengeSavings challengeSavings = new ChallengeSavings();
        challengeSavings.setMemberID(memberID);
        challengeSavings.setPlanName(planName);
        challengeSavings.setTargetSavingsPeriod(targetSavingsPeriod);
        challengeSavings.setTargetSavingsAmount(targetSavingsAmount);
        challengeSavings.setPaymentFrequency(paymentFrequency);
        challengeSavings.setPaymentDate(paymentDate);
        challengeSavings.setPaymentDay(paymentDay);
        challengeSavings.setPaymentAmount(paymentAmount);
        challengeSavings.setTransferMethod(transferMethod);
        challengeSavings.setTransferAccount(transferAccount);
        challengeSavings.setExpectedPrincipal(expectedPrincipal);
        challengeSavings.setExpectedInterest(expectedInterest);
        challengeSavings.setExpirationOption(expirationOption);
        challengeSavings.setChallengeSavingsAccountNumber(challengeSavingsAccountNumber);
        challengeSavings.setChallengeSavingsAccountPW(challengeSavingsAccountPW);
        // endDay를 ChallengeSavings 객체에 설정
        challengeSavings.setEndDay(endDay);
        System.out.println(challengeSavings);

        // 서비스를 통해 데이터베이스에 저장
        savingsService.insertPaymentPlan(challengeSavings);
        // 서비스 클래스의 메서드를 통해 PurchasePlanListItem 업데이트
        String[] purchasePlanIDs = request.getParameterValues("selectPurchasePlanID");

        if (purchasePlanIDs != null) {
            for (String planID : purchasePlanIDs) {
                int purchasePlanID = Integer.parseInt(planID);

                // 서비스 클래스의 메서드를 통해 PurchasePlanListItem 업데이트
                savingsService.updatePlanListItemSavingsAccountNumber(memberID, purchasePlanID, challengeSavingsAccountNumber);
                savingsService.updatePlanItemSavingStatus(memberID, purchasePlanID);
            }
        }

        return "redirect:/checkMyChallengeSavings";
    }

    @PostMapping("/updatePurchasePlan")
    public String updatePurchasePlan(@RequestBody List<PlanItemRatio> planDataList) {
        for (PlanItemRatio planData : planDataList) {
            // 각 매핑된 데이터를 추출
            int selectPurchasePlanID = planData.getSelectPurchasePlanID();
            int ratio = planData.getRatio();

            System.out.println("구매계획리스트 아이디: " + selectPurchasePlanID);
            System.out.println("업데이트할 분배비율: " + ratio);

            try {
                // 서비스를 통해 업데이트 쿼리 실행
                savingsService.updatePlanItemRatio(planData);
            } catch (Exception e) {
                e.printStackTrace();
                return "업데이트 중 오류가 발생했습니다.";
            }
        }

        // 적절한 응답을 반환
        return "업데이트가 완료되었습니다.";
    }

    @GetMapping("/getAllChallengeSavings")
    public ResponseEntity<List<ChallengeSavings>> getAllChallengeSavings(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String memberID = (String) session.getAttribute("memberID");

        List<ChallengeSavings> savingList = savingsService.getAllChallengeSavings(memberID);
        System.out.println(" 테스트" + savingList);
        return ResponseEntity.ok(savingList);
    }

    @GetMapping("/getPurchasePlanByAccountNumber")
    public ResponseEntity<List<SavingPurchasePlan>> getPurchasePlanByAccountNumber(
            @RequestParam("challengeSavingsAccountNumber") String challengeSavingsAccountNumber,
            HttpServletRequest request) {
        HttpSession session = request.getSession();
        String memberID = (String) session.getAttribute("memberID");

        // challengeSavingsAccountNumber를 이용하여 해당 계좌의 구매 계획을 조회
        List<SavingPurchasePlan> purchasePlanList = savingsService.getPurchasePlanByAccountNumber(challengeSavingsAccountNumber, memberID);
        System.out.println("적금계좌와 연결된 구매계획리스트" + purchasePlanList);
        if (!purchasePlanList.isEmpty()) {
            // 조회된 구매 계획 목록을 반환
            return ResponseEntity.ok(purchasePlanList);
        } else {
            // 구매 계획이 없을 경우 404 상태 코드 반환
            return ResponseEntity.notFound().build();
        }
    }

}
