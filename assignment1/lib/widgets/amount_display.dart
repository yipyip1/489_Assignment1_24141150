import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../constants/app_theme.dart';

// shows the "Taka:" label and the entered amount at the top
class AmountDisplay extends StatelessWidget {
  final String amount;
  final bool isTablet;

  const AmountDisplay({
    super.key,
    required this.amount,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    final double scaleFactor = isTablet ? 1.4 : 1.0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: kPaddingLarge * scaleFactor,
        vertical: kPaddingMedium * scaleFactor,
      ),
      decoration: BoxDecoration(
        color: AppTheme.amountDisplayBg,
        borderRadius: BorderRadius.circular(kBorderRadius),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Taka: ',
            style: AppTheme.amountLabelStyle.copyWith(
              fontSize: AppTheme.amountLabelStyle.fontSize! * scaleFactor,
            ),
          ),
          Flexible(
            child: Text(
              amount.isEmpty ? '0' : amount,
              style: AppTheme.amountValueStyle.copyWith(
                fontSize: AppTheme.amountValueStyle.fontSize! * scaleFactor,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
