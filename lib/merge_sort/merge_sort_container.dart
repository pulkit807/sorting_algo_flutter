import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorting_visual/merge_sort/merge_sort_provider.dart';

class SortVisual extends StatefulWidget {
  final double height;

  const SortVisual({Key key, this.height}) : super(key: key);
  @override
  _SortVisualState createState() => _SortVisualState();
}

class _SortVisualState extends State<SortVisual> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(width: 2.0, color: Colors.red)),
          height: widget.height / 3,
          child: Consumer<MergeSort>(
            builder: (ctx, state, _) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: state.array
                      .map((e) => Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(0.05),
                            child: Container(
                              height: e / 120 * widget.height / 3,
                              color: state.array.indexOf(e) == state.left
                                  ? Colors.orange
                                  : state.array.indexOf(e) == state.right
                                      ? Colors.red
                                      : state.array.indexOf(e) >= state.sorted
                                          ? Colors.green
                                          : Colors.blue,
                            ),
                          )))
                      .toList(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
