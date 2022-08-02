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

 List _items = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/gts.json');
    final data = await json.decode(response);
    setState(() {
      _items = data[GtsModel];
    });
  }

  List <String> findSearch = [];
   @override
  void initState() {
    // TODO: implement initState
     _items = findSearch;
    super.initState();
  }

 void _runFilter(String enteredKeyword) {
   List<Map<String, dynamic>>? results = [];
   if (enteredKeyword.isEmpty) {
     results = _items.cast<Map<String, dynamic>>();
   } else {
     results = _items
         .where((user) =>
         user["page"].toLowerCase().contains(enteredKeyword.toLowerCase())).cast<Map<String, dynamic>>()
         .toList();
   }
   setState(() {
     findSearch = results!.cast<String>();
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: const Text("Search", style: TextStyle(color: Colors.blue),),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.filter_list_rounded, color: Colors.black,)
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
              child:   Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: 'Search'
                  ),
                  onChanged: (value) => _runFilter(value),
                ),
              ),
            ),
          ),
        ),
      ),




      // body: Padding(
      //   padding: const EdgeInsets.all(10),
      //   child: Column(
      //     children: [
      //       Expanded(
      //         child: findSearch.isNotEmpty
      //             ? ListView.builder(
      //           itemCount: findSearch.length,
      //           itemBuilder: (context, index) => Card(
      //             //key: ValueKey(findSearch[index]['page'].toString()),
      //             color: Colors.white54,
      //             elevation: 4,
      //             margin: const EdgeInsets.symmetric(vertical: 10),
      //             child: ListTile(
      //               title: Text(findSearch[index]['page'].toString()),
      //               subtitle: Text(
      //                   '${findSearch[index]['chapterName'].toString()} '),
      //             ),
      //           ),
      //         )
      //             : const Text(
      //           'No results found',
      //           style: TextStyle(fontSize: 24),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),


      // body: FutureBuilder(
      //   future: readJson(),
      //   builder: (context, data){
      //     if(data.hasError){
      //       return Center(child: Text("${data.error}"));
      //     }else if(data.hasData){
      //       var items =data.data as List<GtsModel>;
      //       return ListView.builder(
      //           itemCount: items.length,
      //           itemBuilder: (context,index){
      //             return Card(
      //               margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      //               child: Container(
      //                 padding: const EdgeInsets.all(8),
      //                 child: Row(
      //                   children: [
      //                     Expanded(child: Container(
      //                       padding: const EdgeInsets.only(bottom: 8),
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Padding(padding: const EdgeInsets.only(left: 8,right: 8),
      //                             child: Text(items[index].page.toString(),
      //                             style: const TextStyle(
      //                               fontSize: 16,
      //                               fontWeight: FontWeight.bold
      //                           ),),),
      //                           const SizedBox(height: 20,),
      //                           Padding(padding: const EdgeInsets.only(left: 8,right: 8),
      //                             child: Text(items[index].chapterName.toString()),)
      //                         ],
      //                       ),
      //                     ))
      //                   ],
      //                 ),
      //               ),
      //             );
      //           }
      //       );
      //     }else{
      //       return const Center(child: CircularProgressIndicator(),);
      //     }
      //   },
      // )
    );
  }
}