import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_stream/controller/chat_controller.dart';
import 'package:riverpod_firestore_stream/dto/chat/chat_req_dto.dart';

import '../../../domain/chat/chat_firestore_repository.dart';

class ChatRoomPage extends ConsumerWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatController = ref.read(chatControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("riverpod & firestore & stream"),
      ),
      body: _buildListView(ref),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Random random = Random(); // seed값 주지 않기
          ChatInsertReqDto dto = ChatInsertReqDto(
              from: "ssar", to: "cos", msg: "hello -  ${random.nextInt(100)}");
          chatController.insert(dto);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget _buildListView(WidgetRef ref) {
  final chatStream = ref.watch(chatStreamProvider);
  return chatStream.when(
    data: (chats) {
      if (chats.isNotEmpty) {
        return ListView.separated(
          itemCount: chats.length,
          itemBuilder: (context, index) => ListTile(
            title: Text("msg : ${chats[index].msg}"),
            subtitle: Text("from : ${chats[index].from}"),
          ),
          separatorBuilder: (context, index) => Divider(),
        );
      } else {
        return Center(
          child: Text(
            "채팅 내역 없음",
          ),
        );
      }
    },
    error: (error, stackTrace) {
      print("디버그 :${error.toString()}");
      return CircularProgressIndicator();
    },
    loading: () {
      print("디버그 :로딩");
      return CircularProgressIndicator();
    },
  );
}
