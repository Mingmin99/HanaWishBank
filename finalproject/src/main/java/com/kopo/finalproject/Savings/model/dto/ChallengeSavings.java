package com.kopo.finalproject.Savings.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@Data
public class ChallengeSavings {
    private int challengeSavingsID;
    private String memberID;
    private String planName;
    private int targetSavingsAmount;
    private int targetSavingsPeriod;
    private int paymentAmount;
    private String paymentFrequency;
    private String paymentDay;
    private int paymentDate;
    private String transferMethod;
    private long transferAccount;
    private int expectedPrincipal;
    private int expectedInterest;
    private String expirationOption;
    private Date startDay;
    private Date endDay;
    private long challengeSavingsAccountNumber;
};

