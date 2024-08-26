import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';

class CountdownTimer extends StatefulWidget {
  final int seconds;
  final VoidCallback onFinished;

  const CountdownTimer({
    super.key,
    required this.seconds,
    required this.onFinished,
  });

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.seconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
        widget.onFinished();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: '00:${_remainingSeconds.toString().padLeft(2, '0')}',
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        const CustomText(
          text: 'ارسال مرة اخرى خلال',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),

      ],
    );
  }
}