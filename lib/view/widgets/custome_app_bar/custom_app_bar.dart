import 'package:flutter/material.dart';
class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'Wallpaper',style: TextStyle(
            color: Colors.white,fontWeight: FontWeight.bold,
            fontSize: 32
           ),
          children: [
            TextSpan(
                text: '  Village',style: TextStyle(
              fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold
            )
            ),
            TextSpan(
                text: ' + City',style: TextStyle(
                fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold
            )
            )
          ]
        )
    );
  }
}
