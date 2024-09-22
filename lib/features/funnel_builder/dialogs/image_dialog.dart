import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_flow/core/widgets/base_dialog.dart';
import 'package:lead_flow/data/models/image_view_params.dart';
import 'package:lead_flow/features/funnel_builder/domain/funnel_builder_cubit.dart';

class ImageDialog extends StatefulWidget {
  const ImageDialog({super.key});

  @override
  State<ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  List<String> images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVEll8uICS2xqheOz2l1Vh1DcvpEyxgVrNfw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9YYh5Fk1u9VsWWr1MhkyQeOzeNbtnnMO96g&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ1ipeQbFseUM_GzxwMoQj45w9HtAnu4eu5w&s',
  ];

  String imageLink = 'assets/images/example1.jpeg';

  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      height: 300,
      width: 130,
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: List.generate(
          images.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              imageLink = images[index];
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: selectedIndex == index ? Border.all(color: Colors.green, width: 2) : null,
                image: DecorationImage(image: NetworkImage(images[index]), fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      ),
      onCreate: () {
        ImageViewParams imageViewParams = ImageViewParams(imageLink: imageLink);
        context.read<FunnelBuilderCubit>().addComponentParams(imageViewParams);
      },
    );
  }
}
