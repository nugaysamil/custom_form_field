import 'package:custom_form_field/custom/custom_form_view_mixin.dart';
import 'package:custom_form_field/custom/custom_validator.dart';
import 'package:custom_form_field/widget/custom_form_keys.dart';
import 'package:custom_form_field/widget/form_field/check_box_form_field.dart';
import 'package:custom_form_field/widget/form_field/sheet_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final class CustomFormView extends StatefulWidget {
  const CustomFormView({super.key});

  @override
  State<CustomFormView> createState() => _CustomFormViewState();
}

class _CustomFormViewState extends State<CustomFormView>
    with CustomFormViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: customFormKey,
        onChanged: onFormChange,
        child: Column(
          children: [
            const _FirstNameController(),
            const _LastNameController(),
            CheckBoxFormField(title: CustomFormKeys.agree),
            SheetFormField(),
            _SubmitButton(formValidateNotifier: formValidateNotifier),
          ],
        ),
      ),
    );
  }
}

class _LastNameController extends StatelessWidget {
  const _LastNameController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? value) => CustomValidator(value: value).emptyCheck,
      decoration: InputDecoration(labelText: CustomFormKeys.lastName),
    );
  }
}

class _FirstNameController extends StatelessWidget {
  const _FirstNameController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? value) => CustomValidator(value: value).emptyCheck,
      decoration: InputDecoration(labelText: CustomFormKeys.firstName),
    );
  }
}

final class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    required this.formValidateNotifier,
  });

  final ValueNotifier<bool> formValidateNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: formValidateNotifier,
        builder: (context, value, child) {
          return ElevatedButton(
            onPressed: !value
                ? null
                : () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Form is valid'),
                      ),
                    );
                  },
            child: const Text('Submit'),
          );
        });
  }
}
