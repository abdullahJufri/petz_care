import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class FieldInput extends StatelessWidget {
  const FieldInput({
    Key? key,
    required this.hint,
    this.controller,
    this.focusNode,
    this.validateMode,
    this.validator,
    this.onSubmitted,
    this.maxLength,
    this.canNext = false,
    this.numberKeyboard = false,
    this.numberInput = false,
    this.maxLines = 1,
  }) : super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final AutovalidateMode? validateMode;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;
  final String hint;
  final int? maxLength;
  final int maxLines;
  final bool canNext;
  final bool numberKeyboard;
  final bool numberInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autovalidateMode: validateMode ?? AutovalidateMode.onUserInteraction,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: 1,
      // expands: (maxLines > 1) ? true : false,
      decoration: InputDecoration(
        labelText: hint,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
      ),
      keyboardType:
          (numberKeyboard || numberInput) ? TextInputType.number : null,
      inputFormatters: (numberInput)
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : null,
      onFieldSubmitted: onSubmitted,
      textInputAction: (canNext) ? TextInputAction.next : null,
      validator: validator,
    );
  }
}

// ignore: must_be_immutable
class FieldDateTime extends StatelessWidget {
  FieldDateTime({
    Key? key,
    required this.ctrlText,
    required this.onSaved,
    this.focusNode,
    this.nextFocus,
    this.disableBackDate = false,
    this.isReadOnly = false,
    this.timeInput = false,
    this.borderOutline = true,
    this.hint,
    this.dateFormat,
    this.timeFormat,
  }) : super(key: key);

  final TextEditingController ctrlText;
  final Function(String?)? onSaved;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final bool disableBackDate;
  final bool isReadOnly;
  final bool timeInput;
  final bool borderOutline;
  final String? dateFormat;
  final String? timeFormat;
  final String? hint;

  final DateTime currentDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: disableBackDate ? currentDate : DateTime(1970),
      lastDate: DateTime(currentDate.year + 20),
    );

    if (picked != null) {
      ctrlText.text = DateFormat(dateFormat ?? "yyyy-MM-dd").format(picked);
      if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: currentTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(),
          child: child!,
        );
      },
    );

    if (picked != null) {
      currentTime = picked;
      DateTime pickedTimeFormat = DateFormat.jm().parse(picked.format(context));
      ctrlText.text = DateFormat("HH:mm").format(pickedTimeFormat);
      if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: ctrlText,
      decoration: InputDecoration(
        border: borderOutline ? const OutlineInputBorder() : null,
        hintText: (borderOutline)
            ? (hint != null)
                ? hint
                : (dateFormat != null)
                    ? dateFormat
                    : (timeFormat != null)
                        ? timeFormat
                        : "YYYY-MM-DD"
            : null,
        labelText: (!borderOutline)
            ? (hint != null)
                ? hint
                : (dateFormat != null)
                    ? dateFormat
                    : (timeFormat != null)
                        ? timeFormat
                        : "YYYY-MM-DD"
            : null,
        contentPadding: (!borderOutline)
            ? const EdgeInsets.symmetric(
                vertical: 10,
              )
            : null,
        suffixIcon: Icon(
          (timeInput) ? Icons.access_time : Icons.date_range,
          color: Colors.grey,
        ),
      ),
      onTap: () => !isReadOnly
          ? timeInput
              ? _selectTime(context)
              : _selectDate(context)
          : null,
      onSaved: onSaved,
      focusNode: focusNode,
    );
  }
}
