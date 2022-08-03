import 'package:flutter/material.dart';
import 'package:quotes/src/core/utils/app_colors.dart';
import 'package:quotes/src/core/utils/media_query_values.dart';

class ErrorWidget extends StatelessWidget {
  final VoidCallback? onPress;

  const ErrorWidget({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Icon(
            Icons.warning_amber_rounded,
            color: AppColors.primary,
            size: 150,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: const Text(
            'Something went wrong',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        const Text(
          'Please try again',
          style: TextStyle(
              color: AppColors.hint, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Container(
          height: 55,
          width: context.width * 0.55,
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: AppColors.primary,
                onPrimary: Theme.of(context).primaryColor,
                elevation: 500,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: const Text(
              'Reload Screen',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              if (onPress != null) onPress!();
            },
          ),
        )
      ],
    );
  }
}
