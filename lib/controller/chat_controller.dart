//Provider

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_stream/domain/chat/chat_firestore_repository.dart';
import 'package:riverpod_firestore_stream/dto/chat/chat_req_dto.dart';

final chatControllerProvider = Provider((ref) {
  return ChatController(ref);
});

class ChatController {
  final Ref _ref;

  ChatController(this._ref);

  void insert(ChatInsertReqDto dto) async {
    DocumentReference doc =
        await _ref.read(chatFireStoreRepositoryProvider).insert(dto);
    print("디버그 : ${doc.snapshots()}"); // 현재 document의 상태를 리턴해준다.
    print("디버그 : ${doc.id}");
  }
}
