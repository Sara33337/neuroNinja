import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/feature/chatBot/logic/services/chatBotService.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  List<Map<String, String>> messages = [];
  List<String> commonQuestions = [];
  TextEditingController _messageController = TextEditingController();
  bool isLoading = false;
  bool hasStartedConversation = false; // Track if conversation has started

  @override
  void initState() {
    super.initState();
    fetchCommonQuestions();
  }

  Future<void> fetchCommonQuestions() async {
    try {
      final questions = await ChatbotService.fetchCommonQuestions();
      setState(() {
        commonQuestions = questions;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  void _setQuestion(String question) {
    setState(() {
      _messageController.text = question;
    });
  }

  Future<void> _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    String userMessage = _messageController.text.trim();
    setState(() {
      messages.add({"sender": "user", "text": userMessage});
      _messageController.clear();
      isLoading = true;
      hasStartedConversation = true; // Hide chatbot image when message is sent
    });

    String response = await ChatbotService.askQuestion(userMessage);

    setState(() {
      messages.add({"sender": "bot", "text": response});
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            appBar(
              showChatIcon: true,
              showNotificationIcon: true,
            ),
            SizedBox(height: 10.h,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Hide chatbot image when the conversation starts
                    if (!hasStartedConversation)
                      Container(
                        width: 273.w,
                        height: 268.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFF82FFA), width: 2),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/chatBot.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    if (!hasStartedConversation) SizedBox(height: 20.h),
                    if (!hasStartedConversation)
                      Text(
                        "What can I help with?",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 28.sp, color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    if (!hasStartedConversation) SizedBox(height: 20.h),
                    commonQuestions.isNotEmpty
                        ? SizedBox(
                            height: 50.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: commonQuestions.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                  child: InkWell(
                                    onTap: () => _setQuestion(commonQuestions[index]),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(20.r),
                                        border: Border.all(color: const Color(0xFFF82FFA), width: 1),
                                      ),
                                      child: Center(
                                        child: Text(
                                          commonQuestions[index],
                                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : CircularProgressIndicator(),
                    SizedBox(height: 20.h),
                    Container(
                      height: 400.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return Align(
                            alignment: messages[index]["sender"] == "user" ? Alignment.centerRight : Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 4.h),
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: messages[index]["sender"] == "user" ? const Color(0xFFC9C9C9) : Colors.grey[800],
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Text(
                                messages[index]["text"]!,
                                style: TextStyle(
                                  color: messages[index]["sender"] == "user" ? Colors.black : Colors.white, 
                                  fontSize: 16.sp),
                              ),
                            ),
                            
                            
                            
                          );
                        },
                      ),
                      
                    ),
                    if (isLoading)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              height: 49.h,
              width: 361.w,
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Color(0xFFC9C9C9),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 15.h),
                  hintText: "Write your inquiry",
                  hintStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.black.withOpacity(0.50)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  suffixIcon: IconButton(
                    onPressed: _sendMessage,
                    icon: Icon(Icons.arrow_circle_up_outlined, color: Color(0xFF430098), size: 30.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
