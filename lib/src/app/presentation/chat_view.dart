import 'package:apex_mobile/src/app/provider/chat_controller.dart';
import 'package:apex_mobile/src/core/constants/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ChatView extends ConsumerStatefulWidget {
  const ChatView({super.key});

  @override
  ConsumerState<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  final TextEditingController _textController = TextEditingController();
  late final ScrollController scrollController;

  double _panelHeightOpen = 0;

  final ValueNotifier<bool> _showRecommend = ValueNotifier<bool>(true);

  void _handleSubmitted(String text) async {
    if (text.isEmpty) return;
    _textController.clear();

    _showRecommend.value = false;

    ref.read(messageControllerProvider.notifier).addMessage(text);

    ref.read(messageControllerProvider.notifier).getMessage(text);

    // await ref.read(chatControllerProvider.notifier).sendMessage(text);
  }

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Life',
                style: TextStyle(
                  color: Color(0xFF24284E),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'GPT',
                style: TextStyle(
                  color: Color(0xFFF91A5D),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ValueListenableBuilder(
                valueListenable: _showRecommend,
                builder: (context, value, child) {
                  if (value) {
                    return Column(
                      children: [
                        _buildRecommend(
                          "Minimum əmək haqqı alıram. Sağlamlıqla bağlı problemlerim var. Həyat siğortası haqqında məlumat ala bilərəm?",
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
              Consumer(
                builder: (context, buildRef, child) {
                  final messages = buildRef.watch(messageControllerProvider);
                  return Flexible(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (_, int index) => Align(
                        alignment: messages[index]
                            .alignment, // Align messages to the right
                        child: messages[index],
                      ),
                    ),
                  );
                },
              ),
              _buildTextComposer(),
            ],
          ),
        ],
      ),
    );
  }

  InkWell _buildRecommend(String text) {
    return InkWell(
      onTap: () {
        _textController.text = text;
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: const IconThemeData(
        color: AppColors.primary, // Consider adjusting if necessary
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        padding: const EdgeInsets.only(
          left: 12,
          right: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white, // Background color of the text field
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'Write your message',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send, color: AppColors.primary),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final Alignment alignment;

  const ChatMessage({
    super.key,
    required this.text,
    this.alignment = Alignment.centerRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: switch (alignment) {
          Alignment.centerRight => AppColors.primary,
          Alignment.centerLeft => Colors.white,
          _ => AppColors.primary,
        },
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: switch (alignment) {
            Alignment.centerRight => Colors.white,
            Alignment.centerLeft => AppColors.primary,
            _ => AppColors.primary,
          },
          fontSize: 16,
        ),
      ),
    );
  }
}
