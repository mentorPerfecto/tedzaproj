import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/providers.dart';

class CustomTextField extends ConsumerStatefulWidget {
  const CustomTextField({
    required this.fieldLabel,
    super.key,
    this.height,
    this.width,
    this.hint,
    this.controller,
    this.labelHint = '',
    this.spacing,
    this.suffixText,
    this.fontSize,
    this.textInputAction,
    this.keyboardType,
    this.initialValue,
    this.readOnly = false,
    this.padding,
    this.showSuffixIcon = true,
    this.showSuffixText = false,
    this.prefixIcon,
    this.password = false,
    this.trailing,
    this.inputFormatter,
    this.onTap,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.textColor,
    this.maxLines,
    this.isFilled = true,
    this.fillColor = Colors.transparent,
    // const Color(0xffF9F9F9),
    this.borderColor,
    this.validator,
    this.obscureInput = false,
    this.onObscureText,
    this.borderRadius = 5.11,
    this.maxlength,
    this.enabled = true,
    this.useForgotPass = false,
    this.onForgotPassTap,
    this.visibleField = true,
    this.borderWidth = 1.0,
    this.focusNode,
    this.showError = false,
    this.errorText,
    this.onChanged,
  });

  final String? hint;
  final String fieldLabel;
  final String labelHint;
  final String? suffixText;
  final double? spacing;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? initialValue;
  final bool readOnly;
  final EdgeInsetsGeometry? padding;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? prefixIcon;
  final bool? password;
  final bool? showSuffixIcon;
  final bool? showSuffixText;
  final Widget? trailing;
  final VoidCallback? onTap;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final Color? textColor;
  final double? fontSize;
  final int? maxLines;
  final double? borderWidth;
  final bool isFilled;
  final Color? fillColor;
  final Color? borderColor;
  final FormFieldValidator<String>? validator;

  final bool obscureInput;
  final void Function()? onObscureText;
  final double borderRadius;
  final int? maxlength;
  final bool useForgotPass;
  final bool enabled;
  final void Function()? onForgotPassTap;
  final bool visibleField;
  final double? width;
  final double? height;
  final FocusNode? focusNode;
  final bool? showError;
  final String? errorText;
  final Function(String?)? onChanged;

  @override
  ConsumerState<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends ConsumerState<CustomTextField> {
  // myFocusNode = focusNode;
  @override
  Widget build(BuildContext context) {
    var themeMode = ref.watch(themeViewModel).themeMode;
    final myFocusNode = widget.focusNode;
    final theme = Theme.of(context);
    return Visibility(
      visible: widget.visibleField,
      // ignore: sized_box_for_whitespace
      child: Container(
        width: widget.width,
        height: widget.height,
        // padding: EdgeInsets.only(bottom: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            widget.fieldLabel.isNotEmpty ? Column(
              children: [
                TextView(text: widget.fieldLabel,),
                const Gap(10),
              ],
            ) : const SizedBox.shrink(),
            TextFormField(

              onChanged: widget.onChanged,
              maxLength: widget.maxlength,
              inputFormatters: widget.inputFormatter,
              controller: widget.controller,
              textInputAction: widget.textInputAction,
              focusNode: myFocusNode,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w400,
                fontFamily: 'TTHoves',
                fontSize: widget.fontSize ?? 14.spMin,
              ),
              keyboardType: widget.keyboardType,
              initialValue: widget.initialValue,
              textCapitalization: widget.textCapitalization,
              onTap: widget.onTap,
              readOnly: widget.readOnly,
              enabled: widget.enabled,
              textAlign: widget.textAlign,
              maxLines: widget.maxLines ?? 1,
              validator: widget.validator,
              obscureText: widget.obscureInput,
              decoration: InputDecoration(
              //  label:
                border: widget.readOnly ? InputBorder.none : null,
                hintText: widget.hint,
                hintStyle: theme.textTheme.bodyMedium!.copyWith(
                  color: widget.readOnly
                      ? themeMode == ThemeMode.light
                          ? AppColors.kBlack4
                          : AppColors.kWhite

                      ///Check if this is the best color for the darkmode
                      : theme.colorScheme.primary,
                  fontFamily: 'TTHoves',
                  fontSize: 15.spMin,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: widget.prefixIcon,
                suffixText: widget.showSuffixText! ? widget.suffixText : '',
                suffixIcon: widget.textAlign == TextAlign.center
                    ? null
                    : widget.showSuffixIcon!
                        ? Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Visibility(
                                visible: widget.password!,
                                child: GestureDetector(
                                  onTap: widget.onObscureText,
                                  child: SizedBox(
                                    height: 40.h,
                                    width: 45.w,
                                    // color: Colors.red,
                                    child: Icon(
                                      widget.obscureInput
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      size: 20.r,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.trailing != null,
                                child: widget.trailing ?? const SizedBox(),
                              ),
                            ],
                          )
                        : null,
                filled: widget.isFilled,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                fillColor: widget.readOnly ? theme.cardColor : widget.fillColor,
                enabledBorder: widget.isFilled
                    ? OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        borderSide: BorderSide(
                          color: themeMode == ThemeMode.light
                              ? AppColors.kDisabledButton
                              : AppColors.kDarkSecondary,
                        ),
                      )
                    : InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(
                      color: theme.primaryColor,
                      width: widget.borderWidth!.spMin),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(color: theme.colorScheme.error),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide(color: theme.colorScheme.error),
                ),
                errorStyle: TextStyle(color: theme.colorScheme.error),
                errorMaxLines: 4,
              ),
            ),
            // if (myFocusNode.hasFocus)
            //   Text(
            //     // 'Hello',
            //     validatorOne.validateEmail(widget.controller!.text) ?? '',
            //     // widget.validators!.validateEmail(widget.controller!.text) ?? '',
            //     style: TextStyle(color: Colors.red),
            //   ),

            Gap(
              5.spMin,
            ),

            Visibility(
              visible: widget.useForgotPass,
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: widget.onForgotPassTap,
                  child: Text(
                    'Forgot Password?',
                    style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Campton',
                      fontSize: 12.spMin,
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

  String? validateText(
      String text, String? Function(String) validationFunction) {
    return validationFunction(text);
  }
}

///
///
///
///
