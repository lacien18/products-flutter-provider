
import 'package:flutter/material.dart';
import 'package:products/core/domain/entities/snackbar_type.dart';
import 'package:products/core/theme/theme.dart';

class SnackBarContent extends StatelessWidget {
  const SnackBarContent({
    super.key,
    required this.message,
    required this.snackBarType,
  });

  final String message;
  final SnackBarType snackBarType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Icon(
            snackBarType.value.icon,
            color: Colors.white,
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              message,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: AppTheme.theme.textTheme.bodySmall!.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
