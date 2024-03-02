import 'package:apex_mobile/src/app/presentation/chat_view.dart';
import 'package:apex_mobile/src/config/client/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageControllerProvider = StateNotifierProvider<MessageController, List<ChatMessage>>((ref) {
  return MessageController();
});

class MessageController extends StateNotifier<List<ChatMessage>>{
  MessageController() : super([]);

  void addMessage(String text){
    state = [ChatMessage(text: text), ...state];
  }

  void getMessage(String message){
    final client = DioClient();
    client.getMessage(message).then((value) {
      state = [ChatMessage(text: value, alignment: Alignment.centerLeft,), ...state];
    });
  }
}

