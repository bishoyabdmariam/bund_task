import 'package:flutter/material.dart';

import '../../Constants/TextStylesConstants.dart';
class TermsTypesWidget extends StatelessWidget {
  const TermsTypesWidget({
    super.key,
    required this.termType,
  });

  final String termType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Text(
        termType,
        style: Styles.style13YearsTerm,
      ),
    );
  }
}
