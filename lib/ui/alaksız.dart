class alaka extends StatefulWidget {
  const alaka({Key? key}) : super(key: key);

  @override
  State<alaka> createState() => _alakaState();
}

class _alakaState extends State<alaka> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: welcomeBar("Comments"),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            ListView.builder(
                itemCount: widget.data.comments.length,
                itemBuilder: (context, index){
                  var commentID = widget.data.comments[index];
                  getUserCredentials(commentID);
                  return ListTile(
                    onTap: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => OtherProfilePage(data: data,)));
                    },
                    title: Text(currentUser.username, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColors.primary),),
                    subtitle:Text(displayedComment, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColors.primary),),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(currentUser.profilePic),),
                  );
                }

            ),
            Spacer(),
            Container(
                height: SizeConfig.screenHeight/8,
                margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*5,),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    color: AppColors.inputColor,
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal),
                    child: TextFormField(
                      maxLines: 3,
                      cursorColor: AppColors.textColor,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.comment,
                          color: AppColors.textColor,
                        ),
                        hintText: "Type Here",
                        hintStyle: TextStyle(
                          height: 2.4,
                        ),
                        border: InputBorder.none,

                      ),


                      onSaved: (value) {
                        commentDone = value ?? '';

                      },
                    ),
                  ),
                )
            ),
            SizedBox(height: 0,),
            Container(
              height: SizeConfig.screenHeight/15,
              margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*10,vertical: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: FlatButton(
                    color: AppColors.buttonColor,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(commentDone);
                        _formKey.currentState!.save();
                        addComment(commentDone);
                      }


                    },
                    child: Text("Add Comment",
                      style: welcomeButtonTextStyle,),
                  )


              ),
            ),



          ],
        ),
      ),

    );
  }
}
