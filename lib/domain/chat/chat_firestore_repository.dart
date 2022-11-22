//Provider

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatFireStoreRepository = Provider((ref) {
  return ChatFireStoreRepository();
});

class ChatFireStoreRepository {
  final db = FirebaseFirestore.instance;

  void insert() {}
}
