import 'package:flutter/material.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/ui/profile.dart';
import 'package:untitled2/ui/profile_edit.dart';
import 'package:untitled2/ui/feedPage.dart';

class exploreScreen extends StatefulWidget {

  @override
  State<exploreScreen> createState() => _exploreScreenState();
  static const String routeName = "/explore";
}

class _exploreScreenState extends State<exploreScreen> {
  TextEditingController? _textEditingController = TextEditingController();
  List<String> categoriesOnSearch = [];
  List<String> categories = [
    'food',
    'sport',
    'history',
    'entertainment',
    'cafe',
  ];
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    void _ONTAP(index) {
      setState(() {
        _selectedIndex = index;
        if(index == 0)
        {
          Navigator.pushNamedAndRemoveUntil(context, feedPage.routeName, (route) => false);
        }
        else if(index == 1)
        {
          Navigator.pushNamedAndRemoveUntil(context, exploreScreen.routeName, (route) => false);
        }
        else if(index == 2)
        {
          Navigator.pushNamedAndRemoveUntil(context, Profile_Edit.routeName, (route) => false);
        }
        else if(index == 3)
        {

        }
        else if(index == 4)
        {
          Navigator.pushNamedAndRemoveUntil(context, Profile.routeName, (route) => false);
        }
      });
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Container(
            decoration: BoxDecoration(color: Colors.orange.shade200,
                borderRadius: BorderRadius.circular(30)),
            child: TextField(
              onChanged: (value){
                setState((){
                  categoriesOnSearch = categories.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();
                });
              },
              controller: _textEditingController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'Search'

              ),
            ),
          ),

          actions: [
            TextButton(
              onPressed: (){
                categoriesOnSearch.clear();
                _textEditingController!.clear();
                setState((){
                  _textEditingController!.text= '';
                });
              },
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: _textEditingController!.text.isNotEmpty && categoriesOnSearch.isEmpty?
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search_off, size: 75,color: Colors.orange,),
              Text('No results found!', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            ],
          ),
        )
            : ListView.builder(
            itemCount: _textEditingController!.text.isNotEmpty ? categoriesOnSearch.length: categories.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  CircleAvatar(
                    child: Icon(Icons.category),
                    backgroundColor: Colors.orange,
                    foregroundColor: AppColors.primary,
                  ),
                  SizedBox(width: 10,),
                  Text(_textEditingController!.text.isNotEmpty ? categoriesOnSearch[index]: categories[index],
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,)),
                ],),
              );
            }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.orange,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: 'Map',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Camera',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.orange,

          ),
        ],
        onTap: _ONTAP,
      ),
    );
  }
}
    