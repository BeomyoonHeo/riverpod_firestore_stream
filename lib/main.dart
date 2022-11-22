import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_stream/firebase_options.dart';
import 'package:riverpod_firestore_stream/view/pages/chat_room/chat_room_page.dart';

void main() async {
  // 메인이 async를 가지고 있으면 메서드를 나가기 때문에 메인 자체가 종료가 된다 -> ensurInitialized 메서드를 걸어서 메인 메서드를 빠져나가지 못하게 잡아놓는다.
  WidgetsFlutterBinding.ensureInitialized(); // 메인메서드에 비동기 작업이 있을 경우 무조건 걸어줘야한다.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatRoomPage(),
    );
  }
}
