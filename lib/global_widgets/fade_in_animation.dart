import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

enum AniProps { opacity, translateY }

class FadeInAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeInAnimation({
    super.key,
    required this.delay,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween<double>(
        AniProps.opacity,
        Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(
          milliseconds: 500,
        ),
      )
      ..tween<double>(
        AniProps.translateY,
        Tween<double>(begin: -30.0, end: 0.0),
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.easeOut,
      );

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      tween: tween,
      duration: tween.duration,
      builder: (_, Movie value, Widget? child) {
        return Opacity(
          opacity: value.get<double>(AniProps.opacity),
          child: Transform.translate(
            offset: Offset(0, value.get<double>(AniProps.translateY)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}