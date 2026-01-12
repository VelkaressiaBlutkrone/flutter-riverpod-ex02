import 'package:flutter/material.dart';
import 'package:flutter_card_ui_app_ex01/logger.dart';

class CardProvider extends Notification {
  List<Card> build() {
    logger.i('card provider builder...');
    return [];
  }

  Future<({bool success, String message})> addCard() async {
    return (success: true, message: 'Success Add Card');
  }
}
