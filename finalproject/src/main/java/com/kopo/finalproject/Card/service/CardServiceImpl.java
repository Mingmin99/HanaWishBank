package com.kopo.finalproject.Card.service;

import com.kopo.finalproject.Card.model.dao.CardMapper;
import com.kopo.finalproject.Card.model.dto.Card;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CardServiceImpl implements CardService {
    @Autowired
    private CardMapper cardMapper;

    @Override
    public List<Card> getRegisteredCardByMemberID(String memberID) {
        List<Card> cards = cardMapper.getRegisteredCardByMemberID(memberID);
        return cards;
    }
}