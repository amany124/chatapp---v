import 'package:chatapp/models/MessageModel.dart';
import 'package:chatapp/widgets/constant.dart';
import 'package:chatapp/widgets/custemMesagetextfeild.dart';
import 'package:chatapp/widgets/customTextFeild.dart';
import 'package:chatapp/widgets/custumCircleButton.dart';
import 'package:chatapp/widgets/messageBubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class chatPage extends StatefulWidget {
  chatPage({super.key});

  static String id = 'chatpage';

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  final Scroll_controller = ScrollController();
  TextEditingController textcontroller = TextEditingController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  bool Isloading = false;

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return ModalProgressHUD(
      inAsyncCall: Isloading,
      child: StreamBuilder<QuerySnapshot>(
          // you have to check that you has the data before displaying it
          stream: messages.orderBy(kcreatedAt, descending: true).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // print(snapshot.data!.docs[1]['message content']);
              List<MessageModel> messagesList = [];
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                messagesList.add(MessageModel.fromjson(snapshot.data!.docs[i]));
              }

              var scaffold = Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.2,
                  toolbarHeight: 80,
                  leading: Icon(
                    Icons.menu,
                    color: kprimaryColor,
                    size: 28,
                  ),
                  title: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Chatter',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              // fontWeight: FontWeight.w400,
                              fontSize: 21,
                              color: kprimaryColor,
                            ),
                          ),
                          Text(
                            'by amanyalzanfaly',
                            style: TextStyle(
                              color: kprimaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          color: kprimaryColor,
                          size: 28,
                        )),
                  ],
                ),
                body: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: Scroll_controller,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return messagesList[index].id == email
                              ? MessageBubble(
                                  message: messagesList[index],
                                )
                              : MessageBubbleforFreind(
                                  message: messagesList[index],
                                );
                        },
                      ),
                    ),
                    Container(
                      child: custom_message_textfeild(
                        textcontroller: textcontroller,
                        Scroll_controller: Scroll_controller,
                        email: email,
                        onsubmitted: (data) {
                          if (data != '') {
                            messages.add({
                              'id': email,
                              'message content': data,
                              kcreatedAt: DateTime.now(),
                            });
                            textcontroller.clear();
                            Scroll_controller.animateTo(0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          } else {
                            Scroll_controller.animateTo(0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
              return scaffold;
            } else {
              return Container(
                color: Color.fromARGB(255, 219, 217, 217).withOpacity(
                    0.5), // Set a light gray background color with some opacity
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors
                        .transparent, // Set the background color of the circle indicator to transparent
                    valueColor: AlwaysStoppedAnimation<Color>(Colors
                        .blue), // Set the color of the circle indicator to blue
                  ),
                ),
              );
            }
          }),
    );
  }
}
