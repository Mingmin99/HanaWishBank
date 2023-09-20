package com.kopo.finalproject.Savings.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@Data
@AllArgsConstructor
public class Account {
    private String MemberID;
    private long AccountNumber;
    private String AccountName;
    private int AccountPW;
    private int AccountStatus;
    private Date AccountCreateDate;
    private int Balance;
    private String AccountType;
    private String BankCode;

}
