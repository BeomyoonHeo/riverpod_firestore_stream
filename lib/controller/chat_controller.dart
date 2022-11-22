//Provider

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_stream/domain/chat/chat_firestore_repository.dart';
import 'package:riverpod_firestore_stream/dto/chat/chat_req_dto.dart';

final chatController = Provider((ref) {
  return ChatController(ref);
});

class ChatController {
  final Ref _ref;

  ChatController(this._ref);

  void insert(ChatInsertReqDto dto) async {
    DocumentReference dr = await _ref.read(chatFireStoreRepository).insert(dto);
  }
}
