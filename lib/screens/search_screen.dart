import 'package:flutter/material.dart';

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
                padding: EdgeInsets.only(left: 18.0),
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
      body: ListView(
        children: const [

        ],
      ),

    );
  }
}
