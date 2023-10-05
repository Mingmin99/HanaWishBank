package com.kopo.finalproject.HWBMember.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class TransferRecord {
    private int  RecordID;
    private String memberID;
    private long depositAccount;
    private long accountNumber;
    private int transferAmount;
    private String transferDate;
    private String transferMethod;

}
