import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/selection_params.dart';

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
    // widget.onSelect(widget.singleSelectParams.textOptions[index]);
  }

  @override
  Widget build(BuildContext context) {
    return true
        // widget.singleSelectParams.isGrid
        ? GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.9,
            ),
            // children: List.generate(
            //   widget.singleSelectParams.textOptions.length,
            //   (index) {
            //     return SelectionItemView(
            //       params: widget.singleSelectParams.toSelectionItemParams(
            //           text: widget.singleSelectParams.textOptions[index],
            //           size: widget.singleSelectParams.size,
            //           isSelected: selectedIndex == index,
            //           onSelect: onSelected,
            //           index: index,
            //           imagePath: widget.singleSelectParams.imagePaths?[index],
            //           icon: widget.singleSelectParams.icons?[index]),
            //       isCheckable: false,
            //     );
            //   },
            // ),
          )
        : SizedBox();
    // : ListView(
    //     shrinkWrap: true,
    //     physics: const NeverScrollableScrollPhysics(),
    //     children: List.generate(
    //       widget.singleSelectParams.textOptions.length,
    //       (index) {
    //         return Padding(
    //           padding: const EdgeInsets.symmetric(vertical: 4),
    //           child: SelectionItemView(
    //             params: widget.singleSelectParams.toSelectionItemParams(
    //               text: widget.singleSelectParams.textOptions[index],
    //               size: widget.singleSelectParams.size,
    //               isSelected: selectedIndex == index,
    //               onSelect: onSelected,
    //               index: index,
    //               icon: widget.singleSelectParams.icons?[index],
    //             ),
    //             isCheckable: false,
    //           ),
    //         );
    //       },
    //     ),
    //   );
  }
}
