package com.kopo.finalproject.Card.model.dao;

import com.kopo.finalproject.Card.model.dto.Card;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CardMapper {
    List<Card> getRegisteredCardByMemberID(String memberID);

}
