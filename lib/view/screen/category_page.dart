import 'package:flutter/material.dart';

import '../widgets/category_section.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children:[
              Image.network('https://images.pexels.com/photos/733745/pexels-photo-733745.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                fit: BoxFit.cover ,height: MediaQuery.sizeOf(context).height*0.28,width: MediaQuery.sizeOf(context).width,),
              Container(
                color: Colors.black38,
                  height: MediaQuery.sizeOf(context).height*0.28,width: MediaQuery.sizeOf(context).width
              ),
              Positioned(
                top: 100,
                left: 20,
                child: Text("Welcome to Cars Categories",style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.w900,fontSize:27,decoration: TextDecoration.none
                  
                ),),
              )
            ]
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height*0.0008,),
          Container(
            height:MediaQuery.sizeOf(context).height,
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 400,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10
                ),
                itemBuilder: (context,index)=>GridTile(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(23),
                        child: Image.network('https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',fit: BoxFit.cover,))
                )
            ),
          )
        ],
      ),
    );
  }
}
