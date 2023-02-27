import 'package:first_app/common/common_function.dart';
import 'package:first_app/common/common_font.dart';
import 'package:flutter/material.dart';

class FFlatButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final TextStyle? labelStyle;
  final ValueNotifier<bool>? isLoading;
  final bool isWrapped;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const FFlatButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      this.isLoading,
      this.color,
      this.labelStyle,
      this.isWrapped = false,
      this.borderRadius = 6.0,
      this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isWrapped ? null : double.infinity,
      child: ValueListenableBuilder<bool>(
        valueListenable: isLoading ?? ValueNotifier(false),
        builder: (context, loading, child) {
          return TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(padding),
              backgroundColor: MaterialStateProperty.all(
                loading ? Theme.of(context).disabledColor : color ?? ownerColorScheme(context).tertiary,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
              ),
              overlayColor: MaterialStateProperty.all(color ?? ownerColorScheme(context).tertiaryContainer),
              foregroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            onPressed: loading ? null : onPressed,
            child: loading
                ? SizedBox(
                    height: 22,
                    width: 22,
                    child: FittedBox(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(color ?? ownerColorScheme(context).tertiaryContainer),
                      ),
                    ),
                  )
                : child!,
          );
        },
        child: Text(
          label,
          style: labelStyle ??
              TextStyle(
                fontFamily: FCommonFont.family,
                color: ownerColorScheme(context).onPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
        ),
      ),
    );
  }
}
