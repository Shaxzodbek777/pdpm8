import 'package:flutter/material.dart';

import '../scopes/home_scopes.dart';

class HomePage extends StatefulWidget {
  static final String id = "HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeScoped scoped = new HomeScoped();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scoped.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scoped Model"),
        ),
        body: ScopedModel<HomeScoped>(
          model: scoped,
          child: ScopedModelDescendant<HomeScoped>(
            builder: (context, child, model){
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: scoped.items.length,
                    itemBuilder: (ctx, index) {
                      return itemOfPost(scoped, scoped.items[index]);
                    },
                  ),
                  scoped.isLoading
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : SizedBox.shrink(),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            // Respond to button press
          },
          child: Icon(Icons.add),
        ));
  }

}