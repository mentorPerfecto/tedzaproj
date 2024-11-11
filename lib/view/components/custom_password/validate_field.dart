import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/view/components/custom_password/requirements_widgets.dart';

import '../../../view_model/theme_view_model.dart';

class PasswordValidatedFields extends ConsumerStatefulWidget {
  /// Constructor
  const PasswordValidatedFields({
    super.key,

    /// [default inputDecoration]
    this.inputDecoration = const InputDecoration(
      hintText: 'Enter password',
      prefixIcon: Icon(Icons.lock),
      border: OutlineInputBorder(),
    ),
    this.textEditingController,
    this.spacing,

    /// [default textInputAction]
    this.textInputAction = TextInputAction.done,
    this.onEditComplete,
    this.confirmPasswordWidget,
    this.onFieldSubmitted,
    this.focusNode,
    this.cursorColor,
    this.onObscureText,
    this.obscureInput = false,
    this.borderRadius = 4,
    this.borderWidth = 1.0,
    this.isFilled = true,
    // const Color(0xffF9F9F9),
    this.borderColor,
    this.fillColor = Colors.transparent,
    this.readOnly = false,

    /// Password requirements initialization
    /// [default inActiveIcon]
    this.inActiveIcon = Icons.check_circle_outline_rounded,

    /// [default activeIcon]
    this.activeIcon = Icons.check_circle_rounded,

    /// [default inActive Color]
    this.inActiveRequirementColor = Colors.grey,

    /// [default active color]
    this.activeRequirementColor = Colors.blue,
  });

  /// Password `validation` is given at the bottom which can be `modified` accordingly.
  /// Full package can be modified easily

  /// Input decoration of Text field by default it is OutlineInputBorder
  final InputDecoration? inputDecoration;

  /// textEditingController for the field
  final TextEditingController? textEditingController;

  // ignore: comment_references
  /// textInputAction for the field. By default its set to [done]
  final TextInputAction? textInputAction;

  /// onEditComplete callBack for the field
  final void Function()? onEditComplete;

  /// onFieldSubmitted callBack for the field
  final String Function(String)? onFieldSubmitted;

  /// focusNode for the field
  final FocusNode? focusNode;
  final Widget? confirmPasswordWidget;

  /// cursorColor
  final Color? cursorColor;

  /// Password requirements attributes
  /// iconData for the icons when requirement is completed
  final IconData? activeIcon;

  /// iconData for the icons when the requirement is incomplete/inActive
  final IconData? inActiveIcon;

  /// color of the text when requirement is completed
  final Color? activeRequirementColor;

  /// color of the text when the requirement is not completed/inActive
  final Color? inActiveRequirementColor;

  final bool obscureInput;
  final bool isFilled;
  final double? borderWidth;
  final double borderRadius;
  final double? spacing;
  final Color? borderColor;
  final Color? fillColor;
  final bool readOnly;

  final void Function()? onObscureText;

  @override
  PasswordValidatedFieldsState createState() => PasswordValidatedFieldsState();
}

class PasswordValidatedFieldsState
    extends ConsumerState<PasswordValidatedFields> {
  String _pass = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var themeMode = ref.watch(themeViewModel).themeMode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// [Password TextFormField]
        /// Use `Form` to validate the field easily
        ///

        TextFormField(
          textInputAction: widget.textInputAction,
          controller: widget.textEditingController,
          keyboardType: TextInputType.text,
          obscureText: widget.obscureInput,
          readOnly: widget.readOnly,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w400,
            fontSize: 14.spMin,
          ),
          decoration: InputDecoration(
            hintText: 'Password',
            // labelText: 'Password',
            hintStyle: theme.textTheme.bodyMedium!.copyWith(
              color: widget.readOnly
                  ? AppColors.kBlack4
                  : theme.colorScheme.primary,
              fontFamily: 'TTHoves',
              fontSize: 15.spMin,
              fontWeight: FontWeight.w400,
            ),
            // labelStyle: theme.textTheme.bodyLarge!.copyWith(
            //   color: AppColors.kGrey,
            //   fontFamily: 'HergonGrotesk',
            // ),
            suffixIcon: GestureDetector(
              onTap: widget.onObscureText,
              child: Icon(
                widget.obscureInput
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: 20.r,
                color: theme.colorScheme.primary,
              ),
            ),
            filled: true,
            fillColor: widget.readOnly ? theme.cardColor : widget.fillColor,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            border: widget.readOnly ? InputBorder.none : null,
            // fillColor: widget.fillColor ?? theme.cardColor,
            enabledBorder: widget.isFilled
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
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
                  color: const Color(0xff3565A1),
                  width: widget.borderWidth!.spMin),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: AppColors.kErrorPrimary),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: AppColors.kErrorPrimary),
            ),
            errorStyle: const TextStyle(color: AppColors.kErrorPrimary),
            errorMaxLines: 4,
            // prefixIcon: Icon(Icons.lock),
          ),
          onEditingComplete: widget.onEditComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          focusNode: widget.focusNode,
          cursorColor: widget.cursorColor,
          onChanged: (value) {
            setState(() {
              _pass = value;
            });
          },
          validator: passwordValidation,
        ),

        SizedBox(height: 15.h),

        widget.confirmPasswordWidget!,
        const SizedBox(height: 25),

        /// [default requirements]
        /// `1 Upper case` requirement
        if (widget.textEditingController!.text.isEmpty)
          Container()
        else
          Column(
            children: [
              PassCheckRequirements(
                passCheck: _pass.contains(RegExp('[A-Z]')),
                requirementText: '1 Uppercase [A-Z]',
              ),

              /// `1 lowercase` requirement
              PassCheckRequirements(
                passCheck: _pass.contains(RegExp('[a-z]')),
                requirementText: '1 lowercase [a-z]',
              ),

              /// `1 numeric value` requirement
              PassCheckRequirements(
                passCheck: _pass.contains(RegExp('[0-9]')),
                requirementText: '1 numeric value [0-9]',
              ),

              // /// `1 special character` requirement
              // PassCheckRequirements(
              //   passCheck: _pass.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
              //   requirementText: r'1 special character [#, $, % etc..]',
              // ),

              /// `6 character length` requirement
              PassCheckRequirements(
                passCheck: _pass.length >= 6,
                requirementText: '6 characters minimum',
              ),
            ],
          ),
      ],
    );
  }

  /// [password validation]
  /// 1 Uppercase
  /// 1 lowercase
  /// 1 numeric value
  /// 1 special character
  /// 6 length password

  /// In case you want to `modify` the requirements change the `RegExp` given below
  String? passwordValidation(String? value) {
    final passValid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$')

            /// [RegExp]
            .hasMatch(value!);
    if (value.isEmpty) {
      return 'Password cannot be emtpy!';
    } else if (!passValid) {
      return 'Requirement(s) missing!';
    }
    return null;
  }
}
