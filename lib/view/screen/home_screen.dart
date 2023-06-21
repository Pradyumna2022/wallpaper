import 'package:flutter/material.dart';
import 'package:wallpaper/controller/api/apiOperator.dart';
import 'package:wallpaper/view/screen/search_screen.dart';
import 'package:wallpaper/view/widgets/category_section.dart';

import '../../controller/api/apiOperator.dart';
import '../../model/photo_model.dart';
import '../widgets/custome_app_bar/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  late List<PhotoModel> trendingWlPhotos;
  getTrendingWlPhotos()async{
    trendingWlPhotos = await ApiOperation.getTrendingWallpapers();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTrendingWlPhotos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomAppBar(),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage(query: searchController.text)));
                  }, icon: Icon(Icons.search),),
                  hintText: 'Search for More.....',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()
                ),
              )
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
            SizedBox(
              height: MediaQuery.sizeOf(context).height*0.08,
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: ((context,index)=>CategorySection())),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
            Container(
              //height:MediaQuery.sizeOf(context).height,
              height: 500,
              margin: EdgeInsets.symmetric(horizontal: 10,vertical:  10),
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: trendingWlPhotos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 400,
                      crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10
                  ),
                  itemBuilder: (context,index)=>GridTile(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(23),
                          child: Image.network(
                            trendingWlPhotos[index].imgSrc ?? ""
                            ,fit: BoxFit.cover,))
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
