import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color? textColor;
  final Color? borderColor;
  final bool loading;
  final bool enabled;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Function action;
  final Widget? leading;
  final Widget? trailing;
  final double? customWidth;
  final double? customHeight;
  final double? trailingWidth;
  final double margin;
  final TextStyle? style;

  const AppButton({
    super.key,
    required this.text,
    required this.color,
    required this.action,
    this.textColor,
    this.borderColor,
    this.enabled = true,
    this.disabledColor,
    this.disabledTextColor,
    this.loading = false,
    this.leading,
    this.trailing,
    this.customWidth,
    this.customHeight,
    this.trailingWidth,
    this.margin = 16,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!loading && enabled) {
          action();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        width: loading ? 120 : customWidth,
        height: customHeight ?? 50,
        margin: EdgeInsets.symmetric(horizontal: margin),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(15),
          color: enabled ? color : disabledColor,
          boxShadow: [
            BoxShadow(
              color:
                  enabled ? Colors.black.withOpacity(0.2) : Colors.transparent,
              offset: const Offset(0, 5),
              blurRadius: 15,
            ),
          ],
        ),
        child: AnimatedSwitcher(
          duration: const Duration(
            milliseconds: 300,
          ),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: loading
              ? LoadingAnimationWidget.staggeredDotsWave(
                  size: 30,
                  color: textColor ?? Colors.white,
                )
              : Text(
                  text,
                  style: style ??
                      TextStyle(
                        color: enabled
                            ? textColor ?? Colors.white
                            : disabledTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                  maxLines: 1,
                ),
        ),
      ),
    );
  }
}
