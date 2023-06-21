import 'package:flutter/material.dart';
import 'package:wallpaper/view/screen/category_page.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child:
              Image.network(
                  'https://images.unsplash.com/photo-1592840062661-a5a7f78e2056?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1332&q=80'
              )
          ),
        ),
        Positioned(
            left: 40,
            child: Text("Cars",style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 17),))
      ]
    );
  }
}
