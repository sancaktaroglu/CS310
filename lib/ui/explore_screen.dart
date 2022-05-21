import 'package:flutter/material.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';
import 'package:untitled2/ui/profile.dart';
import 'package:untitled2/ui/FeedPage.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
  static const String routeName = "/explore";
}

class _ExploreScreenState extends State<ExploreScreen> {
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
    int selectedIndex = 0;

    void onTap(index) {
      setState(() {
        selectedIndex = index;
        if(index == 0)
        {
          Navigator.pushNamedAndRemoveUntil(context, FeedPage.routeName, (route) => false);
        }
        else if(index == 1)
        {
          Navigator.pushNamedAndRemoveUntil(context, ExploreScreen.routeName, (route) => false);
        }
        else if(index == 2)
        {

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
          backgroundColor: AppColors.appbarColor,
          title: Container(
            decoration: BoxDecoration(color: AppColors.primary,
                borderRadius: BorderRadius.circular(30)),
            child: TextField(
              onChanged: (value){
                setState((){
                  categoriesOnSearch = categories.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();
                });
              },
              controller: _textEditingController,
              decoration: const InputDecoration(
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
              child: const Icon(
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
              const Icon(Icons.search_off, size: 75,color: Colors.orange,),
              Text('No results found!', style: searchTextStyle),
            ],
          ),
        )
            : ListView.builder(
            itemCount: _textEditingController!.text.isNotEmpty ? categoriesOnSearch.length: categories.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  const CircleAvatar(
                    backgroundColor: Colors.orange,
                    foregroundColor: AppColors.primary,
                    child: Icon(Icons.category),
                  ),
                  const SizedBox(width: 10,),
                  Text(_textEditingController!.text.isNotEmpty ? categoriesOnSearch[index]: categories[index],
                      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,)),
                ],),
              );
            }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
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
        onTap: onTap,
      )
    );
  }
}
    