import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key,required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
    alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: 30,
        right: 30,
        top: MediaQuery.of(context).size.height * 0.1,
      ),
      child: Card(
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),elevation: 5,
       
        child: child,
      ),
    );
  }
}