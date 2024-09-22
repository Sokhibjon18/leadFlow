import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/selection_params.dart';
import 'package:lead_flow/features/views/selection_item_view.dart';

class MultiSelectView extends StatefulWidget {
  const MultiSelectView({
    super.key,
    required this.selectionParam,
    required this.onSelect,
  });

  final SelectionParams selectionParam;
  final Function(List<String> values) onSelect;

  @override
  State<MultiSelectView> createState() => _MultiSelectViewState();
}

class _MultiSelectViewState extends State<MultiSelectView> {
  final Set<int> selectedIndexes = {};

  void onSelected(String text, int index) {
    setState(() {
      selectedIndexes.contains(index) ? selectedIndexes.remove(index) : selectedIndexes.add(index);
    });
    widget.onSelect(selectedIndexes.map((e) => widget.selectionParam.textOptions[e]).toList());
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
                isSelected: selectedIndexes.contains(index),
                onSelect: onSelected,
                index: index,
              ),
              isCheckable: true,
            ),
          );
        },
      ),
    );
  }
}
