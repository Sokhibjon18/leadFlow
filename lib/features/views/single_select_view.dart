import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/selection_params.dart';
import 'package:lead_flow/features/views/selection_item_view.dart';

class SingleSelectView extends StatefulWidget {
  const SingleSelectView({
    super.key,
    required this.selectionParam,
    required this.onSelect,
  });

  final SelectionParams selectionParam;
  final Function(String value) onSelect;

  @override
  State<SingleSelectView> createState() => _SingleSelectViewState();
}

class _SingleSelectViewState extends State<SingleSelectView> {
  var selectedIndex = -1;

  onSelected(String text, int index) {
    selectedIndex = index;
    setState(() {});
    widget.onSelect(widget.selectionParam.textOptions[index]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        widget.selectionParam.textOptions.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: SelectionItemView(
              params: widget.selectionParam.toSelectionItemParam(
                text: widget.selectionParam.textOptions[index],
                size: widget.selectionParam.size,
                isSelected: selectedIndex == index,
                onSelect: onSelected,
                index: index,
              ),
              isCheckable: false,
            ),
          );
        },
      ),
    );
  }
}
