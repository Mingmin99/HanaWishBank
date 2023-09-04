package com.kopo.finalproject.Card.service;

import com.kopo.finalproject.Card.model.dto.Card;

import java.util.List;

public interface CardService {

    List<Card> getRegisteredCardByMemberID(String memberID);
}
