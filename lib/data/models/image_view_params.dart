import 'package:lead_flow/data/models/component_params.dart';

class ImageViewParams implements ComponentParams {
  final double cornerRadius;
  final String imageLink;

  ImageViewParams({
    this.cornerRadius = 16,
    required this.imageLink,
  });
}
