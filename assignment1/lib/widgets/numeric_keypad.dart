import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../constants/app_theme.dart';

// custom numeric keypad - no system keyboard used
class NumericKeypad extends StatelessWidget {
  final ValueChanged<String> onDigitPressed;
  final VoidCallback onClearPressed;
  final bool isTablet;

  const NumericKeypad({
    super.key,
    required this.onDigitPressed,
    required this.onClearPressed,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    final double scaleFactor = isTablet ? 1.3 : 1.0;

    // null = empty cell in the grid
    final List<List<String?>> rows = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['C', '0', null],
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final double spacing = kPaddingSmall * scaleFactor;

        return Padding(
          padding: EdgeInsets.all(spacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: rows.map((row) {
              return Expanded(
                child: Row(
                  children: row.map((label) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(spacing / 2),
                        child: label == null
                            ? const SizedBox.shrink()
                            : _buildButton(label, scaleFactor),
                      ),
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  // builds a single keypad button
  Widget _buildButton(String label, double scaleFactor) {
    final bool isClear = label == 'C';

    return SizedBox.expand(
      child: ElevatedButton(
        onPressed: () {
          if (isClear) {
            onClearPressed();
          } else {
            onDigitPressed(label);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isClear ? AppTheme.clearButtonColor : AppTheme.keypadButtonColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius * scaleFactor),
          ),
          elevation: 3,
          padding: EdgeInsets.zero,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            isClear ? 'CLEAR' : label,
            style: AppTheme.keypadButtonTextStyle.copyWith(
              fontSize:
                  AppTheme.keypadButtonTextStyle.fontSize! * scaleFactor,
            ),
          ),
        ),
      ),
    );
  }
}
