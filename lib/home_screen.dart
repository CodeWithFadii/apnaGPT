import 'package:chatgpt/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          'Apna GPT',
          style: TextStyle(
              color: AppColors.white,
              fontSize: 19,
              fontWeight: FontWeight.w500),
        ),
        leading: PopupMenuButton(
          position: PopupMenuPosition.under,
          color: AppColors.primary,
          icon: Icon(
            Icons.sort_rounded,
            color: AppColors.white,
            size: 28,
          ),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text(
                  'Clear Chat',
                  style: TextStyle(color: AppColors.white, fontSize: 16),
                ),
              ),
            ];
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: index.isEven
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: index.isEven
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )
                              : const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                          color: index.isEven
                              ? AppColors.primary
                              : const Color.fromARGB(255, 173, 216, 230),
                        ),
                        child: Text(
                          index.isEven
                              ? 'This is a message from user'
                              : 'This is message from ApnaGPT',
                          style: TextStyle(
                              color: index.isEven
                                  ? AppColors.white
                                  : AppColors.primary,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: messageController,
                    textInputAction: TextInputAction.done,
                    onTapOutside: (event) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    maxLines: null,
                    expands: true,
                    cursorColor: AppColors.primary,
                    style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(134, 8, 27, 65),
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                      hintText: 'Message ApnaGPT....',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  child: const CircleAvatar(
                    backgroundColor: AppColors.primary,
                    radius: 28,
                    child: Icon(
                      Icons.send_rounded,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
              ],
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
