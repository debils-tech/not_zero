import 'package:flutter/material.dart';

class StarsRateWidget extends StatefulWidget {
  const StarsRateWidget({
    required this.count,
    required this.onChanged,
    this.initialValue = 0,
    this.colorsByIndex,
    super.key,
  })  : assert(count > 0, "Count can't be less than 1"),
        assert(
          colorsByIndex?.length == count,
          'Count of colors must be equal to count of stars',
        ),
        assert(initialValue < count, 'Initial value must be less than count');

  final int count;
  final int initialValue;
  final List<Color>? colorsByIndex;
  final void Function(int) onChanged;

  @override
  State<StarsRateWidget> createState() => _StarsRateWidgetState();
}

class _StarsRateWidgetState extends State<StarsRateWidget> {
  late int currentValue;

  @override
  void initState() {
    currentValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(widget.count, (index) {
        final active = index <= currentValue;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: _StarIcon(
            active: active,
            onTap: () {
              setState(() => currentValue = index);
              widget.onChanged(currentValue);
            },
            color: widget.colorsByIndex?[currentValue] ?? Colors.white,
          ),
        );
      }),
    );
  }
}

class _StarIcon extends StatelessWidget {
  const _StarIcon({required this.active, this.color, this.onTap});

  final bool active;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(foregroundColor: MaterialStateProperty.all(color)),
      child: Icon(
        active ? Icons.star : Icons.star_border,
        size: 45,
      ),
    );
  }
}
