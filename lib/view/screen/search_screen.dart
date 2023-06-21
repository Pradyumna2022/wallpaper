import 'package:flutter/material.dart';
import 'package:wallpaper/controller/api/apiOperator.dart';
import '../../model/photo_model.dart';
import '../widgets/custome_app_bar/custom_app_bar.dart';

class SearchPage extends StatefulWidget {
  final String query;
  const SearchPage({super.key, required this.query});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  late List<PhotoModel> searchResults;



  getSearchResult()async{
    searchResults = await ApiOperation.searchWallpaper(widget.query);
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchResult();

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
                  decoration: InputDecoration(
                      suffixIcon: IconButton(onPressed: () {

                      }, icon: Icon(Icons.search),),
                      hintText: 'Search for More.....',
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder()
                  ),
                )
            ),

            SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
            Container(
              //height:MediaQuery.sizeOf(context).height,
              height: 500,
              margin: EdgeInsets.symmetric(horizontal: 10,vertical:  10),
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: searchResults.length,
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
                            searchResults[index].imgSrc ?? ""
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
