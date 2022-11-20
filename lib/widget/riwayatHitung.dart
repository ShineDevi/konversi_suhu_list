import 'package:flutter/material.dart';

class history extends StatelessWidget {
  const history({
    Key? key,
    required this.listHistory,
  }) : super(key: key);

  final List<String> listHistory;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: listHistory.length,
            itemBuilder: (context, index) {
              return Text(listHistory[index]);
            }));
  }
}
