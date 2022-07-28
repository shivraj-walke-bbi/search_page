import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/gts_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: const Text("Search"),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.filter_list_rounded)
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0,left: 10.0,right: 10.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 18.0, right: 18.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search'
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: readJsonData(),
        builder: (context,data){
          if(data.hasError){
            return Center(child: Text("${data.error}"));
          }else if(data.hasData){
            var items =data.data as List<GtsModel>;
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context,index){
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: const EdgeInsets.only(left: 8,right: 8),child: Text(items[index].page.toString(),style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),),),
                                const SizedBox(height: 20,),
                                Padding(padding: const EdgeInsets.only(left: 8,right: 8),child: Text(items[index].chapterName.toString()),)
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                }
            );
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }

Future<List<GtsModel>>readJsonData() async{
  final jsondata = await rootBundle.loadString('assets/gts.json');
  final list = json.decode(jsondata) as List<dynamic>;

  return list.map((e) => GtsModel.fromJson(e)).toList();
}
}