import 'package:flutter/material.dart';

class SelectableTileItem extends StatefulWidget {
  final IconData icon;
  final String   title;
  final Function onSelect;
  final bool isSelected;

  const SelectableTileItem({
    Key key,
    this.icon,
    this.title,
    this.onSelect,
    this.isSelected = false,
  });

  @override
  State createState() => new _SelectableTileItem();
}

class _SelectableTileItem extends State<SelectableTileItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onSelect,
      child: Container(
        decoration: BoxDecoration(
          color: widget.isSelected
              ? Colors.black.withOpacity(0.3)
              : Colors.transparent,
          borderRadius: BorderRadius.all(
              Radius.circular(20)
          )
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.8),
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Icon(widget.icon, size: 40),
            SizedBox(width: 28),
            Text(widget.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}