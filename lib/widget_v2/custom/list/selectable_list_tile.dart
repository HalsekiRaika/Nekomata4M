import 'package:Nekomata/widget_v2/custom/tiles/selectable_tile_item.dart';
import 'package:flutter/material.dart';

class SelectableListTile extends StatefulWidget {
  final List<SelectableTileItem> items;
  final ValueChanged<int> onSelect;
  final int currentIndex;

  const SelectableListTile({
    Key key,
    this.items,
    this.onSelect,
    this.currentIndex = 0
  });

  @override
  State createState() => new _SelectableListTile();
}

class _SelectableListTile extends State<SelectableListTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 6.0, thickness: 0.01,);
        },
        itemBuilder: (BuildContext context, int index) {
          return SelectableTileItem(
            icon: widget.items[index].icon,
            title: widget.items[index].title,
            onSelect: (){ setState((){ { widget.onSelect(index); }});},
            isSelected: widget.currentIndex == index,
          );
        },
        itemCount: widget.items.length,
      ),
    );
  }
}