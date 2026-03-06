import 'dart:io';
import 'package:flutter/material.dart';
import '../../../widgets/photo_upload_box.dart'; 

class PhotoSection extends StatelessWidget {
  final File? photoBefore;
  final File? photoAfter;
  final bool showAfter;
  final VoidCallback onPickBefore;
  final VoidCallback onPickAfter;
  final VoidCallback onClearBefore;
  final VoidCallback onClearAfter;

  const PhotoSection({
    super.key, required this.photoBefore, required this.photoAfter, required this.showAfter,
    required this.onPickBefore, required this.onPickAfter, required this.onClearBefore, required this.onClearAfter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(children: [
        Expanded(child: PhotoUploadBox(
          label: "Before", file: photoBefore, 
          onTap: onPickBefore, onClear: onClearBefore
        )),
        if (showAfter) ...[
          const SizedBox(width: 12),
          Expanded(child: PhotoUploadBox(
            label: "After", file: photoAfter, 
            onTap: onPickAfter, onClear: onClearAfter, themeColor: Colors.green,
          )),
        ]
      ]),
    );
  }
}