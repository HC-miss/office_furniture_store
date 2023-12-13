import 'package:flutter/material.dart';
import 'package:office_furniture_store/global_widgets/fade_in_animation.dart';

extension WidgetExtension on Widget {
  Widget fadeAnimation(double delay) {
    return FadeInAnimation(delay: delay, child: this);
  }
}
