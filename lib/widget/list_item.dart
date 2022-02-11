import 'package:flutter/material.dart';
import 'package:vorkinsta/models/ca_model.dart';

class ListItem extends StatelessWidget {
  final CaModel item;
  const ListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        item.title,
        style: TextStyle(
            color: item.color, fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }
}
