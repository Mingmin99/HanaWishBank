package com.kopo.finalproject.Card.model.dto;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@Data
public class Card {
    private String memberID;
    private String cardID;
    private String cardNumber;
    private Date cardExpiryDate;
    private int CVV;
    private String cardType;
    private String cardOwnerName;
    private String issuingBank;
    private int cardPW;
    private String imageFront;
    private String imageBack;
}