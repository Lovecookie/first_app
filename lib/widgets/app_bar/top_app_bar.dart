import 'package:first_app/provider/state_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  final Size barHeight = const Size.fromHeight(56.0);

  @override
  Size get preferredSize => barHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageName = ref.watch(pageNameProvider);

    return AppBar(
      title: Text(pageName),
    );
  }
}
