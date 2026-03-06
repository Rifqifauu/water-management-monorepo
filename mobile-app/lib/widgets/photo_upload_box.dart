import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class PhotoUploadBox extends StatelessWidget {
  final String label;
  final File? file;
  final VoidCallback onTap;
  final VoidCallback onClear;
  final Color themeColor;

  const PhotoUploadBox({
    super.key, required this.label, required this.file,
    required this.onTap, required this.onClear, this.themeColor = Colors.blue
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black54)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: DottedBorder(
            color: Colors.grey[300]!, strokeWidth: 2, dashPattern: const [6, 4],
            borderType: BorderType.RRect, radius: const Radius.circular(16),
            child: Container(
              height: 140, width: double.infinity,
              decoration: BoxDecoration(color: file == null ? Colors.white : Colors.grey[100], borderRadius: BorderRadius.circular(16)),
              child: file == null
                  ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(Icons.add_a_photo, color: Colors.grey[400]),
                      Text("Upload", style: TextStyle(color: themeColor, fontWeight: FontWeight.bold))
                    ]))
                  : Stack(children: [
                      ClipRRect(borderRadius: BorderRadius.circular(14), child: Image.file(file!, fit: BoxFit.cover, width: double.infinity, height: double.infinity)),
                      Positioned(top: 4, right: 4, child: GestureDetector(onTap: onClear, child: const CircleAvatar(radius: 12, backgroundColor: Colors.red, child: Icon(Icons.close, size: 14, color: Colors.white))))
                    ]),
            ),
          ),
        )
      ],
    );
  }
}