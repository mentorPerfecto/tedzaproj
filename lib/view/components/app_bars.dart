import 'package:flutter/material.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/utils.dart';

class AppBars {
  static PreferredSizeWidget mainAppBar(
    BuildContext context, {
    String? text,
    Widget? trailing,
    Widget? bottom,
    double? textSize,
    void Function()? callback,
    bool isVisible = true,
    bool bottomVisible = false,
    required Color? backgroundColor,
    required Color? arrowBackColor,
    Color? titleColor,
    bool? iWantToEditAProperty,
  }) {
    return AppBar(
      backgroundColor: backgroundColor,
      leading: Visibility(
        visible: isVisible,
        child: InkWell(
            onTap: () {
              navigateBack(context);
            },
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 24.spMin,
                color: arrowBackColor,
              ),
              splashRadius: 20,
              onPressed: () {
                if (callback != null) {
                  callback();
                }
                navigateBack(context);
              },
            )),
      ),
      title: text != null
          ? TextView(
              text: text,
              fontSize: textSize == null ? 16.spMin : textSize.spMin,
              fontFamily: ttHoves,
              fontWeight: FontWeight.w600,
            )
          : const SizedBox.shrink(),
      centerTitle: true,
      actions: [trailing ?? const SizedBox.shrink()],
      bottom: bottomVisible
          ? PreferredSize(
              preferredSize: const Size(0, 0), child: bottom ?? Container())
          : null,
    );
  }
}
