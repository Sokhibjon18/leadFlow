import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/selection_params.dart';

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
    // widget.onSelect(selectedIndexes.map((e) => widget.multiSelectParams.textOptions[e]).toList());
  }

  @override
  Widget build(BuildContext context) {
    return
        // widget.multiSelectParams.isGrid
        true
            ? GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                )
                //   children: List.generate(
                //     // widget.multiSelectParams.textOptions.length,
                //     3,
                //     (index) {
                //       return SelectionItemView(
                //         params: widget.multiSelectParams.toSelectionItemParam(
                //             text: widget.multiSelectParams.textOptions[index],
                //             size: widget.multiSelectParams.size,
                //             isSelected: selectedIndexes.contains(index),
                //             onSelect: onSelected,
                //             index: index,
                //             imagePath: widget.multiSelectParams.imagePaths![index],
                //             icon: widget.multiSelectParams.icons?[index]),
                //         isCheckable: true,
                //       );
                //     },
                //   ),
                )
            : SizedBox();
    // : ListView(
    //     shrinkWrap: true,
    //     physics: const NeverScrollableScrollPhysics(),
    //     children: List.generate(
    //       widget.multiSelectParams.textOptions.length,
    //       (index) {
    //         return Padding(
    //           padding: const EdgeInsets.symmetric(vertical: 4),
    //           child: SelectionItemView(
    //             params: widget.multiSelectParams.toSelectionItemParam(
    //               text: widget.multiSelectParams.textOptions[index],
    //               size: widget.multiSelectParams.size,
    //               isSelected: selectedIndexes.contains(index),
    //               onSelect: onSelected,
    //               index: index,
    //             ),
    //             isCheckable: true,
    //           ),
    //         );
    //       },
    //     ),
    //   );
  }
}
