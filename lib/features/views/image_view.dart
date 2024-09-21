import 'package:flutter/material.dart';
import 'package:lead_flow/data/models/image_view_params.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    super.key,
    required this.imageParams,
  });

  final ImageViewParams imageParams;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
        // imageParams.cornerRadius,
        20,
      )),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
        // vertical: imageParams.verticalPadding,
        // horizontal: imageParams.horizontalPadding,
      ),
      child: Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYaO6lWOo30L2AqIVF76Mx8WS-8OrnlUJw7w&s',
        // imageParams.imageLink,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
