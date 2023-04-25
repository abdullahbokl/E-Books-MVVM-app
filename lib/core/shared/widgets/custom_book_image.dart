import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import 'custom_circular_indicator.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.heightCalculator(20)),
      child: AspectRatio(
        aspectRatio: 1.5 / 2,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          placeholder: (context, url) => const CustomCircularIndicator(),
          errorWidget: (context, url, error) => Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            child: const Icon(Icons.error_outline, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
