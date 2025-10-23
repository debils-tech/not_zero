import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class HabitsListAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HabitsListAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(context.t.habits.list.title),
    );
  }
}
