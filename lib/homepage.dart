import 'package:flutter/material.dart';
import 'package:lists/list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List myList = [
    ['apples', 'bonks', 'sinks', 'blinks'],
    ['binkorials', 'ssslonks', 'sinks', 'sags'],
    ['bipples', 'sipples', 'ripples', 'clipples']
  ];

  List myItemList = [
    ListItem(title: 'Ready Player', items: [
      ItemModel(isDone: false, title: 'hi there'),
      ItemModel(isDone: false, title: 'hi there'),
      ItemModel(isDone: false, title: 'hi there')
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7EAF0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 75,
                ),
                ListItem(
                  title: 'MY BIG TITLE',
                  items: [
                    ItemModel(isDone: false, title: 'hi there'),
                    ItemModel(isDone: false, title: 'hi stupid face'),
                    ItemModel(isDone: true, title: 'hi ship farter'),
                    ItemModel(isDone: false, title: 'hi pink ponk pooper'),
                  ],
                ),
                const SizedBox(height: 25),
                ListItem(
                  title: 'LITTLE TITLE',
                  items: [
                    ItemModel(isDone: false, title: 'sing a song'),
                    ItemModel(isDone: false, title: 'love it'),
                    ItemModel(
                        isDone: false,
                        title:
                            'sing a song pooody pooody poo papoody .. poody poody poo papoody ROODY'),
                    ItemModel(isDone: true, title: 'love it'),
                    ItemModel(isDone: true, title: 'sing a song'),
                    ItemModel(isDone: false, title: 'love it'),
                    ItemModel(isDone: false, title: 'Glad this is over'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
