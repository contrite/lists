import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemModel {
  ItemModel({required String this.title, required bool this.isDone});
  String title = "";
  bool isDone = false;
}

class ListItem extends StatefulWidget {
  //ListItem({Key? key}) : super(key: key);

  ListItem({Key? key, required this.title, required this.items})
      : super(key: key);
  String title = '';
  int doneItems = 0;
  int totalItems = 0;
  List<ItemModel> items = [];

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  double percentDone = 0;

  @override
  void initState() {
    super.initState();
    _updatePercentage();
  }

  _updatePercentage() {
    widget.doneItems = 0;
    widget.totalItems = 0;
    for (var item in widget.items) {
      widget.totalItems += 1;
      if (item.isDone) {
        widget.doneItems += 1;
      }
    }
    percentDone = widget.doneItems / widget.totalItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE7EAF0),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x2556707E),
            offset: Offset(0.0, 15.0),
            blurRadius: 25.0,
            spreadRadius: -3,
          ),
          BoxShadow(
            color: Color(0x50FFFFFF),
            offset: Offset(0.0, -2.0),
            blurRadius: 0.0,
            spreadRadius: 0,
          ),
        ],
      ),
      width: 280,
      // height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 10),
            child: Center(
                child: Text(widget.title,
                    style: GoogleFonts.mulish(
                        fontSize: 18,
                        color: Color(0xFF5D7082),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4))),
          ),
          for (var item in widget.items)
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 10, 8, 0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    item.isDone = !item.isDone;
                    _updatePercentage();
                  });
                },
                child: Text('•   ' + item.title,
                    style: GoogleFonts.mulish(
                        fontSize: 14,
                        color: Color(0xFF5D7082),
                        decoration:
                            item.isDone ? TextDecoration.lineThrough : null,
                        decorationThickness: 2,
                        decorationColor: Color(0xFF5D7082))),
              ),
            ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
              child: Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFB1BDCB),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0x4056707E),
                        offset: Offset(0.0, 10.0),
                        blurRadius: 8.0,
                        spreadRadius: -3,
                      ),
                    ]),
                child: CircularPercentIndicator(
                  animation: true,
                  animateFromLastPercent: true,
                  radius: 30.0,
                  lineWidth: 16.0,
                  percent: percentDone,
                  animationDuration: 700,
                  //center: new Text("100%"),
                  progressColor: const Color(0xFFB1BDCB),
                  backgroundColor: const Color(0xFFF4F4F4),
                  curve: Curves.easeOutCirc,
                  //backgroundWidth: 40,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
