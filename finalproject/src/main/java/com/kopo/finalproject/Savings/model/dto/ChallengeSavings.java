package com.kopo.finalproject.Savings.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@Data
public class ChallengeSavings {
    private String MemberID;
    private int PurchasePlanID;
    private int WishListID;
    private int ChallengeSavingsAccountNumber;
    private String PlanName;
    private int TargetSavingsAmount;
    private int TargetSavingsPeriod;
    private int PaymentAmount;
    private String PaymentFrequency;
    private String PaymentDay;
    private int PaymentDate;
    private String TransferMethod;
    private int TransferAccount;
    private int ExpectedPrincipal;
    private int ExpectedInterest;
    private String ExpirationOption;
    private Date StartDay;
    private Date EndDay;
};

