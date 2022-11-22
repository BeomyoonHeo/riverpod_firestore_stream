//Provider

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_stream/domain/chat/chat.dart';
import 'package:riverpod_firestore_stream/dto/chat/chat_req_dto.dart';

// 리턴: Stream<List<Chat>>
final chatStreamProvider = StreamProvider<List<Chat>>((ref) {
  final db = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> stream =
      db.collection('chat').snapshots();

  return stream.map((snapshot) =>
      snapshot.docs.map((doc) => Chat.fromJson(doc.data())).toList());

  // return FirebaseFirestore.instance.collection('chat').snapshots().map(
  //     (event) => event.docs
  //         .map((doc) => Chat(
  //             id: doc.id,
  //             from: doc.data()["from"],
  //             to: doc.data()["to"],
  //             msg: doc.data()["msg"]))
  //         .toList());
});

final chatFireStoreRepositoryProvider = Provider((ref) {
  return ChatFireStoreRepository();
});

class ChatFireStoreRepository {
  final db = FirebaseFirestore.instance;

  Future<DocumentReference> insert(ChatInsertReqDto dto) async {
    // documentReference 타입으로 반환 - 문서타입
    return await db.collection('chat').add(dto.toJson());
  }

  // Stream<QuerySnapshot<Map<String, dynamic>>> findAllStream() {
  //   // 지속적으로 계속 주는 것 - 백그라운드 서비스
  //   //db.collection('chat').orderBy("createdAt").snapshots()
  //   return db
  //       .collection('chat')
  //       .snapshots(); // 파싱까지 같이 처리해버리면 stream이 끊기기때문에 바로 stream을 return 함
  // }
}
