import 'package:counter/listprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Nextpage extends StatefulWidget {
  const Nextpage({
    super.key,
  });
  @override
  State<Nextpage> createState() => _NextpageState();
}

class _NextpageState extends State<Nextpage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: (context, itemProviderModel, child) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,
          title: Text(
            'Next Counter',
            style: TextStyle(color: Colors.white),
          ),
        ),
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
        body: Consumer<NumberListProvider>(
          builder: (context, itemProviderModel, child) => Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(itemProviderModel.items.last.toString()),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
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
      ),
    );
  }
}
