import 'package:first_app/common/common_const.dart';
import 'package:first_app/common/common_function.dart';
import 'package:first_app/provider/state_provider.dart';
import 'package:first_app/theme/app_icon.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FBottomMenuBar extends HookConsumerWidget {
  const FBottomMenuBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);

    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: ownerColorScheme(context).onPrimary,
        boxShadow: [
          BoxShadow(
            color: ownerColorScheme(context).shadow,
            offset: const Offset(0, -.1),
            blurRadius: 0,
          )
        ],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: _bottomBarIcons(context, ref),
      ),
    );
  }

  List<Widget> _bottomBarIcons(
    BuildContext context,
    WidgetRef ref,
  ) {
    int i = 0;

    return <Widget>[
      _makeIcon(
        context: context,
        ref: ref,
        pageIndex: i++,
        iconWidget: AppIcon.home(),
      ),
      _makeIcon(
        context: context,
        ref: ref,
        pageIndex: i++,
        iconWidget: AppIcon.search(),
      ),
      _makeIcon(
        context: context,
        ref: ref,
        pageIndex: i++,
        iconWidget: AppIcon.notification(),
      ),
      _makeIcon(
        context: context,
        ref: ref,
        pageIndex: i++,
        iconWidget: AppIcon.message(),
      ),
    ];
  }

  Widget _makeIcon({
    required BuildContext context,
    required WidgetRef ref,
    required int pageIndex,
    required Widget iconWidget,
  }) {
    final bool selected = ref.watch(appStateProvider.notifier).getPageIndex() == pageIndex;

    return Expanded(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: AnimatedAlign(
          duration: const Duration(milliseconds: CommonConst.animDuration),
          curve: Curves.easeIn,
          alignment: const Alignment(0, CommonConst.iconOn),
          child: AnimatedOpacity(
            opacity: CommonConst.alphaOn,
            duration: const Duration(milliseconds: CommonConst.animDuration),
            child: IconButton(
              color: selected ? Colors.black87 : Colors.blueGrey.shade100,
              // highlightColor: selected ? Colors.indigo : Colors.transparent,
              // splashColor: selected ? Colors.indigo : Colors.transparent,
              padding: const EdgeInsets.all(0),
              alignment: const Alignment(0, 0),
              icon: iconWidget,
              onPressed: () {
                ref.watch(appStateProvider.notifier).setPageIndex(pageIndex);
              },
            ),
          ),
        ),
      ),
    );
  }
}
