import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    this.text,
    this.icon,
    required this.value,
    this.onChanged,
    this.width,
    this.height,
    this.border,
  });

  final String? text;
  final IconData? icon;
  final bool value;
  final Function(bool)? onChanged;
  final double? width;
  final double? height;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.white,
      child: Container(
        height: height ?? 63,
        width: width ?? double.infinity, // Ensure full width usage
        decoration: BoxDecoration(
          border: border ?? Border.all(color: Colors.transparent, width: 1.0),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Use maximum available width
          children: [
            Expanded(
              flex: 2, // Give more space to text and icon
              child: Padding(
                padding: const EdgeInsets.all( 15.0), // Reduced padding
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        text ?? '',
                        style: TextStyle(color: Colors.grey),
                        overflow: TextOverflow.ellipsis, // Handle overflow
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Icon(icon, color: Colors.blue),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Switch(
                value: value,
                onChanged: onChanged,
                activeColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
