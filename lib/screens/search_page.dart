import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/gts_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<List<GtsModel>> _loadGTSData() async {
    final gtsJson = await rootBundle.loadString('assets/gts.json');

    final gtsData = jsonDecode(gtsJson) as List<dynamic>;

    return gtsData.map((e) => GtsModel.fromJson(e)).toList();
  }

  String searchText = '';

  List<GtsModel> _allEntries = [];

  @override
  initState() {
    _loadGTSData().then((value) {
      setState(() {
        _allEntries = value;
      });
    });

    super.initState();
  }

  // void _runFilter(String enteredKeyword) {
  //   List<Map<String, dynamic>> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     // if the search field is empty or only contains white-space, we'll display all users
  //     results = GtsModel as List<Map<String, dynamic>>;
  //   } else {
  //     results = GtsModel.where((user) =>
  //             user["text"].toLowerCase().contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //     // we use the toLowerCase() method to make it case-insensitive
  //   }

  //   // Refresh the UI
  //   setState(() {
  //     _foundUsers = results;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    
    final filteredItems = _allEntries.where((element) {
      return element.text.toLowerCase().contains(searchText);
    }).toList();

    debugPrint('searchText: $searchText :: ${filteredItems.length}');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: const Text(
          "Search",
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_list_rounded,
                color: Colors.black,
              ))
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: TextField(
                  decoration: const InputDecoration(hintText: 'Search'),
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: filteredItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(filteredItems[index].text),
                        color: Colors.white54,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(filteredItems[index].page),
                          subtitle: Text(
                              '${filteredItems[index].chapterName.toString()} '),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
