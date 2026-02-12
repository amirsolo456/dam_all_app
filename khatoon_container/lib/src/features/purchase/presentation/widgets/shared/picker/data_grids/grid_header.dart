import 'package:flutter/material.dart';
import 'package:khatoon_container/index.dart';


class GridHeader extends StatelessWidget {
  final List<GridColumn> columns;

  const GridHeader({super.key, required this.columns});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      color: Colors.grey.shade900,
      child: const Row(
        children: <Widget>[
          _HeaderCell('Order ID'),
          _HeaderCell('Name'),
          _HeaderCell('City'),
          _HeaderCell('Country'),
          _HeaderCell(''),
          _HeaderCell(''),
        ],
      ),
    );
  }
}
class _HeaderCell extends StatelessWidget {
  final String title;

  const _HeaderCell(this.title);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}