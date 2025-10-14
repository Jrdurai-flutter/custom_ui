import 'dart:async';
import 'package:flutter/material.dart';
import 'package:custom_ui/custom_button.dart';

class AnimatedStateButtonsDemo extends StatefulWidget {
  final void Function(String) onShowCode;
  const AnimatedStateButtonsDemo({super.key, required this.onShowCode});

  @override
  State<AnimatedStateButtonsDemo> createState() => _AnimatedStateButtonsDemoState();
}

enum _BtnState { idle, loading, success, error, warning }

class _AnimatedStateButtonsDemoState extends State<AnimatedStateButtonsDemo> {
  _BtnState state = _BtnState.idle;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startFlow() {
    setState(() => state = _BtnState.loading);
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 2), () {
      setState(() => state = _BtnState.success);
      _timer = Timer(const Duration(seconds: 2), () {
        setState(() => state = _BtnState.idle);
      });
    });
  }

  void _retryFlow() {
    setState(() => state = _BtnState.loading);
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 2), () {
      setState(() => state = _BtnState.error);
      _timer = Timer(const Duration(seconds: 2), () {
        setState(() => state = _BtnState.warning);
        _timer = Timer(const Duration(seconds: 2), () {
          setState(() => state = _BtnState.idle);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color bg = switch (state) {
      _BtnState.idle => Colors.blue,
      _BtnState.loading => Colors.blueGrey,
      _BtnState.success => Colors.green,
      _BtnState.error => Colors.red,
      _BtnState.warning => Colors.amber,
    };

    final Widget icon = switch (state) {
      _BtnState.idle => const Icon(Icons.play_arrow, color: Colors.white),
      _BtnState.loading => const SizedBox(
          width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)),
      _BtnState.success => const Icon(Icons.check_circle, color: Colors.white),
      _BtnState.error => const Icon(Icons.error, color: Colors.white),
      _BtnState.warning => const Icon(Icons.warning, color: Colors.white),
    };

    final String label = switch (state) {
      _BtnState.idle => 'Submit',
      _BtnState.loading => 'Loading...',
      _BtnState.success => 'Success',
      _BtnState.error => 'Failed',
      _BtnState.warning => 'Warning',
    };

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Animated button: loading → success → reset',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            children: [
              CustomButton(
                text: label,
                type: ButtonType.elevated,
                color: bg,
                icon: icon,
                iconPosition: IconPosition.prefix,
                onPressed: state == _BtnState.loading ? () {} : _startFlow,
                elevation: 4,
              ),
              const SizedBox(width: 12),
              CustomButton(
                text: 'Retry',
                type: ButtonType.outlined,
                color: Colors.deepOrange,
                icon: const Icon(Icons.refresh, color: Colors.deepOrange),
                iconPosition: IconPosition.prefix,
                onPressed: state == _BtnState.loading ? () {} : _retryFlow,
              ),
              const SizedBox(width: 12),
              CustomButton(
                text: 'Gradient',
                type: ButtonType.gradient,
                gradient: const LinearGradient(colors: [Colors.indigo, Colors.cyan]),
                icon: const Icon(Icons.play_arrow, color: Colors.white),
                iconPosition: IconPosition.prefix,
                elevation: 6,
                onPressed: state == _BtnState.loading ? () {} : _startFlow,
              ),
              const SizedBox(width: 12),
              IconButton(
                tooltip: 'Show code',
                icon: const Icon(Icons.code),
                onPressed: () => widget.onShowCode(_snippet),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String get _snippet => """
// Animated button with loading and success states
class MyAnimatedButton extends StatefulWidget {
  const MyAnimatedButton({super.key});
  @override
  State<MyAnimatedButton> createState() => _MyAnimatedButtonState();
}

enum _BtnState { idle, loading, success, error, warning }

class _MyAnimatedButtonState extends State<MyAnimatedButton> {
  _BtnState state = _BtnState.idle;
  void _startFlow() async {
    setState(() => state = _BtnState.loading);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => state = _BtnState.success);
  }

  @override
  Widget build(BuildContext context) {
    final color = state == _BtnState.success ? Colors.green : Colors.blue;
    final icon = state == _BtnState.loading
        ? SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
        : Icon(state == _BtnState.success ? Icons.check_circle : Icons.play_arrow, color: Colors.white);
    final label = state == _BtnState.loading ? 'Loading...' : (state == _BtnState.success ? 'Success' : 'Submit');

    return CustomButton(
      text: label,
      type: ButtonType.elevated,
      color: color,
      icon: icon,
      iconPosition: IconPosition.prefix,
      onPressed: state == _BtnState.loading ? () {} : _startFlow,
    );
  }
}
""";
}


