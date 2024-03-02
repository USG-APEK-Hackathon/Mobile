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
    _panelHeightOpen = MediaQuery.of(context).size.height * .85;
    return Scaffold(
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
                            "I'm searching for a special gift for my loved one. Can you recommend a high-performance and stylish smartphone?"),
                        _buildRecommend(
                            "I'm looking for a budget-friendly, quality phone for my mom. What model do you recommend?")
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (_, int index) => messages[index],
                    ),
                  );
                },
              ),
              Container(
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: _buildTextComposer(),
              ),
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
        color: AppColors.primary,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                onTapOutside: (event) =>
                    FocusManager.instance.primaryFocus!.unfocus(),
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Write your message',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;

  const ChatMessage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        title: Text(text),
      ),
    );
  }
}
