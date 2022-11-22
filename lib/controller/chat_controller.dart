//Provider

import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatController = Provider((ref) {
  return ChatController();
});

class ChatController {}
