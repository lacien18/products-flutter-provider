import 'package:flutter/material.dart';
import 'package:products/core/theme/theme.dart';

class FeedBackView extends StatelessWidget {
  const FeedBackView({
    Key? key,
    required this.icon,
    required this.label,
    this.top = 20,
    this.onTap,
  }) : super(key: key);

  final IconData? icon;
  final String? label;
  final double top;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: top),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.4,
            child: Icon(
              icon,
              size: 40,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            label!,
            textAlign: TextAlign.center,
            style: AppTheme.theme.textTheme.bodySmall?.copyWith(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
