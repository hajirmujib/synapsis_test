import 'package:catatan/app/constants/colors_app.dart';
import 'package:catatan/app/widgets/radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalForm extends StatelessWidget {
  const GlobalForm({
    Key? key,
    this.readOnly = false,
    this.enable = true,
    this.textInputType = TextInputType.name,
    this.onSubmited,
    this.onChanged,
    this.labelText = '',
    this.labelTextRight = '',
    this.labelTextStyle,
    this.labelTextRightStyle,
    this.textController,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.obscuringCharacter,
    this.maxLines = 1,
    this.suffixIcon,
    this.prefixIcon,
    this.radius,
    this.isDense = false,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.onLabelPressed,
    this.inputDecoration,
    this.wrappedBorder,
    this.wrappedBorderPadding,
    this.focusNode,
    this.maxLength,
    this.buildCounter,
    this.inputFormatters,
    this.helperText,
    this.height,
    this.counter,
    this.maxLengthEnforcement,
  }) : super(key: key);
  final bool readOnly;
  final bool enable;
  final TextInputType textInputType;
  final TextInputType? keyboardType;
  final ValueChanged? onSubmited;
  final ValueChanged<String>? onChanged;
  final String labelText;
  final String labelTextRight;
  final TextStyle? labelTextStyle;
  final TextStyle? labelTextRightStyle;
  final TextEditingController? textController;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String? obscuringCharacter;
  final int maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? radius;
  final bool isDense;
  final String? hintText;
  final VoidCallback? onLabelPressed;
  final InputDecoration? inputDecoration;
  final BoxDecoration? wrappedBorder;
  final EdgeInsetsGeometry? wrappedBorderPadding;
  final FocusNode? focusNode;
  final int? maxLength;
  final InputCounterWidgetBuilder? buildCounter;
  final List<TextInputFormatter>? inputFormatters;
  final String? helperText;
  final double? height;
  final Widget? counter;
  final MaxLengthEnforcement? maxLengthEnforcement;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: labelText.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  labelText,
                  // style: labelTextStyle ?? AppTypography.normalMedium,
                ),
              ),
            ),
            Visibility(
              visible: labelTextRight.isNotEmpty,
              child: GestureDetector(
                onTap: onLabelPressed,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    labelTextRight,
                    // style: labelTextRightStyle ?? AppTypography.extraSmallBold,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          decoration: wrappedBorder,
          padding: wrappedBorderPadding,
          height: height,
          child: TextField(
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            buildCounter: buildCounter,
            controller: textController,
            focusNode: focusNode,
            textAlign: TextAlign.left,
            maxLengthEnforcement: maxLengthEnforcement,
            decoration: inputDecoration ??
                InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  // contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                  // isDense: true,
                  filled: true,
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  isDense: isDense,
                  hintText: hintText,
                  helperText: helperText,
                  // helperStyle: AppTypography.extraSmallRegular.copyWith(
                  //   fontWeight: FontWeight.w400,
                  // ),
                  helperMaxLines: 2,
                  contentPadding: const EdgeInsets.only(top: 16),
                  fillColor: readOnly ? AppColors.gray[100] : Colors.white,
                  // hintStyle: AppTypography.smallRegular.copyWith(
                  //   color: const Color(0xFFc0c3cb),
                  // ),
                  counter: counter,
                  prefix: prefixIcon != null
                      ? const SizedBox(width: 8)
                      : const SizedBox(width: 16),
                  suffix: suffixIcon != null
                      ? const SizedBox(width: 8)
                      : const SizedBox(width: 16),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(radius ?? 8)),
                    borderSide: BorderSide(
                      color: AppColors.gray[200]!,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: radius != null
                        ? BorderRadius.all(Radius.circular(radius!))
                        : AppRadius.lg,
                    borderSide: BorderSide(
                      color:
                          readOnly ? Colors.transparent : AppColors.gray[200]!,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: radius != null
                        ? BorderRadius.all(Radius.circular(radius!))
                        : AppRadius.lg,
                    borderSide: BorderSide(
                      color: AppColors.gray[200]!,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(radius ?? 8)),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: radius != null
                        ? BorderRadius.all(Radius.circular(radius!))
                        : AppRadius.lg,
                    borderSide: BorderSide(
                      color: AppColors.gray[200]!,
                    ),
                  ),
                ),
            textInputAction: textInputAction,
            enabled: enable,
            // style: AppTypography.smallRegular,
            maxLines: maxLines,
            autocorrect: false,
            keyboardType: keyboardType,
            onEditingComplete: () {},
            onSubmitted: onSubmited,
            onChanged: onChanged,
            readOnly: readOnly,
            obscureText: obscureText,
            // obscuringCharacter: this.obscuringCharacter,
          ),
        ),
      ],
    );
  }
}
