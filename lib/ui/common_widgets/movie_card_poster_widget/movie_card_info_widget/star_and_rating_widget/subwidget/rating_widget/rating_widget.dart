import 'package:flutter/material.dart';
import 'package:movie_test/ui/common_widgets/text_widget/small_text_widget.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0x44C4C4C4)),
      child: const SmallTextWidget(data: '18 +'),
    );
  }
}
