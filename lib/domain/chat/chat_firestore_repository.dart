//Provider

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_stream/dto/chat/chat_req_dto.dart';

final chatFireStoreRepository = Provider((ref) {
  return ChatFireStoreRepository();
});

class ChatFireStoreRepository {
  final db = FirebaseFirestore.instance;

  Future<DocumentReference> insert(ChatInsertReqDto dto) async {
    // documentReference 타입으로 반환 - 문서타입
    return await db.collection('chat').add(dto.toJson());
  }
}
