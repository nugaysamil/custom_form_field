import 'package:custom_form_field/custom/custom_form_view.dart';
import 'package:flutter/material.dart';

mixin CustomFormViewMixin on State<CustomFormView> {
  final GlobalKey<FormState> customFormKey = GlobalKey<FormState>();

  final ValueNotifier<bool> formValidateNotifier = ValueNotifier<bool>(false);

  void onFormChange() {
    formValidateNotifier.value =
        customFormKey.currentState?.validate() ?? false;
  }
}
