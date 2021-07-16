import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorting_visual/merge_sort/merge_sort_provider.dart';
import 'package:sorting_visual/merge_sort/merge_sort_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => MergeSort(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  MergeSort provider;

  void _toggleSorting() {
    provider.isSorting ? provider.stopSorting() : provider.startSorting();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MergeSort>(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SortVisual(height: height),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleSorting,
        child: provider.isSorting
            ? Icon(Icons.pause_rounded)
            : Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
