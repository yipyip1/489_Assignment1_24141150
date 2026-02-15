import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../models/change_calculator.dart';
import '../widgets/amount_display.dart';
import '../widgets/change_table.dart';
import '../widgets/numeric_keypad.dart';

// main screen - stateful so data survives rotation
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _enteredAmount = '';
  Map<int, int> _breakdown = ChangeCalculator.calculate(0);

  // append digit from the right and recalculate
  void _onDigitPressed(String digit) {
    setState(() {
      _enteredAmount += digit;
      _breakdown = ChangeCalculator.calculate(int.parse(_enteredAmount));
    });
  }

  // reset everything
  void _onClearPressed() {
    setState(() {
      _enteredAmount = '';
      _breakdown = ChangeCalculator.calculate(0);
    });
  }

  // check if device is tablet based on screen size
  bool _isTablet(BoxConstraints constraints) {
    final double shortestSide =
        MediaQuery.of(context).size.shortestSide;
    return shortestSide >= kTabletBreakpoint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VangtiChai'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final bool isTablet = _isTablet(constraints);
              final bool isPortrait = orientation == Orientation.portrait;

              if (isPortrait) {
                return _buildPortraitLayout(isTablet);
              } else {
                return _buildLandscapeLayout(isTablet);
              }
            },
          );
        },
      ),
    );
  }

  // portrait: amount on top, then table + keypad side by side
  Widget _buildPortraitLayout(bool isTablet) {
    final double padding = isTablet ? kPaddingXLarge : kPaddingLarge;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          AmountDisplay(amount: _enteredAmount, isTablet: isTablet),

          SizedBox(height: padding),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 45,
                  child: ChangeTable(
                    breakdown: _breakdown,
                    isTablet: isTablet,
                  ),
                ),

                SizedBox(width: padding),

                Expanded(
                  flex: 55,
                  child: NumericKeypad(
                    onDigitPressed: _onDigitPressed,
                    onClearPressed: _onClearPressed,
                    isTablet: isTablet,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // landscape: table on left, amount + keypad on right
  Widget _buildLandscapeLayout(bool isTablet) {
    final double padding = isTablet ? kPaddingXLarge : kPaddingMedium;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 40,
            child: ChangeTable(
              breakdown: _breakdown,
              isTablet: isTablet,
            ),
          ),

          SizedBox(width: padding),

          Expanded(
            flex: 60,
            child: Column(
              children: [
                AmountDisplay(amount: _enteredAmount, isTablet: isTablet),

                SizedBox(height: padding),

                Expanded(
                  child: NumericKeypad(
                    onDigitPressed: _onDigitPressed,
                    onClearPressed: _onClearPressed,
                    isTablet: isTablet,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
