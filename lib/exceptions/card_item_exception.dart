import 'package:flutter_card_ui_app_ex01/exceptions/app_exception.dart';

class CardItemIdEmptyException extends AppException {
  CardItemIdEmptyException() : super('카드 ID가 비어있습니다.');
}

class CardTitleEmptyException extends AppException {
  CardTitleEmptyException() : super('카드 제목이 비어있습니다.');
}

class CardItemNotFoundException extends AppException {
  CardItemNotFoundException(String id) : super('ID "$id"에 해당하는 카드를 찾을 수 없습니다.');
}

class CardItemDuplicateException extends AppException {
  CardItemDuplicateException(String id) : super('ID "$id"에 해당하는 카드가 이미 존재합니다.');
}
