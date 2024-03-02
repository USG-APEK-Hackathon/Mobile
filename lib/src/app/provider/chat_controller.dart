import 'package:apex_mobile/src/app/presentation/chat_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageControllerProvider = StateNotifierProvider<MessageController, List<ChatMessage>>((ref) {
  return MessageController();
});

class MessageController extends StateNotifier<List<ChatMessage>>{
  MessageController() : super([]);

  void addMessage(String text){
    state = [ChatMessage(text: text), ...state];
  }
}

