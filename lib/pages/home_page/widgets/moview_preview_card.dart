import 'dart:typed_data';

import 'package:flutter/material.dart';

class MoviePreviewCard extends StatelessWidget {
  final String? previewUrl;
  final String name;
  final double? rating;
  final String shortDescription;
  final Uint8List? previewBytes;

  const MoviePreviewCard({
    Key? key,
    required this.previewUrl,
    required this.name,
    required this.rating,
    required this.shortDescription,
    required this.previewBytes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: SizedBox(
        height: 150,
        width: double.maxFinite,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 3 / 4,
              child: previewUrl != null
                  ? Image.network(
                      previewUrl!,
                      errorBuilder: (context, _, __) {
                        return previewBytes != null
                            ? Image.memory(previewBytes!)
                            : const SizedBox();
                      },
                    )
                  : Image.asset(
                      'assets/images/no_poster.png',
                    ),
            ),
            const SizedBox(
              width: 16,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        rating?.toStringAsFixed(1) ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Flexible(
                    child: Text(
                      shortDescription,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
