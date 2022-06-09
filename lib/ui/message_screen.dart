import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/classes/messageCard.dart';
import 'package:untitled2/model/chat.dart';
import 'package:untitled2/model/message.dart';
import 'package:untitled2/util/appBar.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/dimen.dart';

class message_screen extends StatefulWidget {
  const message_screen(
      {Key? key,
        required this.data,
      }) : super(key: key);

  final Chat data;


  @override
  State<message_screen> createState() => _message_screenState();
}

final user = FirebaseAuth.instance.currentUser!;
String uid = user.uid;






String name = "";

List <ChatMessage> messages = [];



bool check = true;

class _message_screenState extends State<message_screen> {


  final TextEditingController _controller = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  final CollectionReference messageCollection = FirebaseFirestore.instance.collection('Messages');

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('Users');

  Future<void> getMessages()  async {
    DocumentSnapshot snapshot =  await userCollection.doc(widget.data.id).get();
    name = snapshot.get('fullname');

    QuerySnapshot querySnapshot = await messageCollection.get();

    for (int i = 0; i < widget.data.who_send.length; i++){
      if (widget.data.who_send[i] == true && widget.data.is_user1 == false){
        messages.add(ChatMessage(text: widget.data.messages[i], receiver: widget.data.id, sender: uid));
      }
      else if(widget.data.who_send[i] == false && widget.data.is_user1 == false){
        messages.add(ChatMessage(text: widget.data.messages[i], receiver: uid, sender: widget.data.id));
      }
      else if(widget.data.who_send[i] == true && widget.data.is_user1 == true){
        messages.add(ChatMessage(text: widget.data.messages[i], receiver: uid, sender: widget.data.id));
      }
      else if(widget.data.who_send[i] == false && widget.data.is_user1 == true){
        messages.add(ChatMessage(text: widget.data.messages[i], receiver: widget.data.id, sender: uid));
      }
    }



    setState( () {});
  }


  @override
  Widget build(BuildContext context) {

    if(check) {
      getMessages();
      check = false;
    }

    SizeConfig().init(context);
    return Scaffold(
      appBar: dmBar(name, context),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) => Message(message: messages[index], user:widget.data.id),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeVertical*2,
              horizontal: SizeConfig.blockSizeHorizontal*2,
            ),
            decoration: BoxDecoration(
              color: AppColors.mainColor.withOpacity(0.8),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 32
                ),
              ],
            ),
            child: SafeArea(
              child: Container(
                height: SizeConfig.blockSizeVertical*6,
                decoration: BoxDecoration(
                  color: AppColors.buttonColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal*3,
                    vertical: SizeConfig.blockSizeVertical,
                  ),
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (String value) async {
                      //db.collection('Messages');
                      messages.add(ChatMessage(text: value, receiver: uid, sender: widget.data.id));
                      DocumentReference ref = FirebaseFirestore.instance.collection('Messages').doc();
                      DocumentSnapshot snapshot = await messageCollection.doc(widget.data.doc_id).get();
                      var all_messages = List<String>.from(snapshot.get('Messages'));
                      var sender = List<bool>.from(snapshot.get('user1_send'));
                      all_messages.add(value);
                      sender.add(widget.data.is_user1 ? true: false);

                      messageCollection.doc(widget.data.doc_id).update({
                        "Messages": all_messages,
                        "user1_send": sender,
                      });
                      _controller.clear();
                    },
                    cursorColor: AppColors.textColor,
                    decoration: InputDecoration(
                      hintText: "Type Message",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.textColor,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
