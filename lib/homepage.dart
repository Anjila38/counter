import 'package:counter/listprovider.dart';
import 'package:counter/nextPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: (context, itemProviderModel, child) => Scaffold(
        floatingActionButton: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                itemProviderModel.add();
              },
              backgroundColor: Colors.green,
              shape: CircleBorder(),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                itemProviderModel.reduce();
              },
              backgroundColor: Colors.green,
              shape: CircleBorder(),
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ],
        ),
        appBar: AppBar(
          title: Text(
            'Counter',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
        body: Consumer<NumberListProvider>(
          builder: (context, itemProviderModel, child) => Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(itemProviderModel.items.last.toString()),
                Expanded(
                  child: ListView.builder(
                    itemCount: itemProviderModel.items.length,
                    itemBuilder: (context, index) {
                      return (Text(
                        itemProviderModel.items[index].toString(),
                        style: TextStyle(fontSize: 20),
                      ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Consumer<NumberListProvider>(
          builder: (context, itemProviderModel, child) =>
              BottomNavigationBar(items: [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Next',
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Nextpage();
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.arrow_forward),
                )),
          ]),
        ),
      ),
    );
  }
}
