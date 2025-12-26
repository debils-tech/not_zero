// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:flutter/material.dart';

class StarsRateWidget extends StatefulWidget {
  const StarsRateWidget({
    required this.count,
    required this.onChanged,
    this.initialValue = 0,
    this.colorsByIndex,
    super.key,
  }) : assert(count > 0, "Count can't be less than 1"),
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
      mainAxisAlignment: .center,
      children: List<Widget>.generate(widget.count, (index) {
        final active = index <= currentValue;

        return Padding(
          padding: const .symmetric(horizontal: 3),
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
    return IconButton(
      onPressed: onTap,
      style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(color)),
      iconSize: 45,
      icon: Icon(active ? Icons.star_rounded : Icons.star_border_rounded),
    );
  }
}
