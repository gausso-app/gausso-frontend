import 'package:flutter/material.dart';

class GaussoButton extends StatefulWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const GaussoButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  State<GaussoButton> createState() => _GaussoButtonState();
}

class _GaussoButtonState extends State<GaussoButton> {
  bool _isPressed = false;

  Color _getDarkerColor(Color color) {
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - 0.15).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
    widget.onPressed();
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkerColor = _getDarkerColor(widget.color);

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: SizedBox(
        height: 56.0,
        child: Stack(
          children: [
            // Bottom shadow/border layer
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: darkerColor,
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            // Top clickable layer
            AnimatedPositioned(
              duration: const Duration(milliseconds: 50),
              left: 0,
              right: 0,
              bottom: _isPressed ? 0 : 4,
              top: _isPressed ? 4 : 0,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.transparent, // Keeps bounds same
                    width: 0,
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.text.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
