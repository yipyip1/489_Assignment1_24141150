import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../constants/app_theme.dart';

// table that shows note breakdown (500, 100, 50 etc)
class ChangeTable extends StatelessWidget {
  final Map<int, int> breakdown;
  final bool isTablet;

  const ChangeTable({
    super.key,
    required this.breakdown,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    final double scaleFactor = isTablet ? 1.3 : 1.0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kBorderRadius),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // header row
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: kPaddingMedium * scaleFactor,
              vertical: kPaddingSmall * scaleFactor,
            ),
            decoration: BoxDecoration(
              color: AppTheme.tableHeaderColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kBorderRadius),
                topRight: Radius.circular(kBorderRadius),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Note',
                    style: AppTheme.tableNoteStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize:
                          AppTheme.tableNoteStyle.fontSize! * scaleFactor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Count',
                    style: AppTheme.tableCountStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize:
                          AppTheme.tableCountStyle.fontSize! * scaleFactor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, thickness: 1),

          // data rows
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: kNoteDenominations.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, thickness: 0.5),
              itemBuilder: (context, index) {
                final int note = kNoteDenominations[index];
                final int count = breakdown[note] ?? 0;

                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: kPaddingMedium * scaleFactor,
                    vertical: kPaddingSmall * scaleFactor,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '$note',
                          style: AppTheme.tableNoteStyle.copyWith(
                            fontSize: AppTheme.tableNoteStyle.fontSize! *
                                scaleFactor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '× $count',
                          style: AppTheme.tableCountStyle.copyWith(
                            fontSize: AppTheme.tableCountStyle.fontSize! *
                                scaleFactor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
