import 'dart:async';
import 'package:flutter/material.dart';
import 'package:netflix_clone__/widget/home_widgets/back_ground_clr.dart';
import 'package:netflix_clone__/widget/bottom_navigation.dart';

dynamic propick;
dynamic username;

class AccountLoading extends StatefulWidget {
  dynamic link;
  dynamic name;
  AccountLoading({super.key, required this.link, required this.name});

  @override
  State<AccountLoading> createState() => _AccountLoadingState();
}

class _AccountLoadingState extends State<AccountLoading> {
  @override
  void initState() {
    setState(() {
      propick = widget.link;
      username = widget.name;
    });
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavi(),
          ));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bckClr,
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 260),
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(image: AssetImage(widget.link))),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
          ],
        )));
  }
}
