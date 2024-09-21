import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    required this.onCreate,
    required this.width,
    required this.height,
    required this.child,
  });

  final void Function() onCreate;
  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: const Color(0xFFF0F2F5),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: SingleChildScrollView(child: child)),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF007BFF)),
                    onPressed: () {
                      onCreate();
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Create',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
