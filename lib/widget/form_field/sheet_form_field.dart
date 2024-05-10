import 'package:custom_form_field/widget/custom_form_sheet.dart';
import 'package:flutter/material.dart';

class SheetFormField extends FormField<bool> {
  SheetFormField({
    super.key,
  }) : super(
            validator: (bool? value) => value ?? false ? null : '',
            builder: (FormFieldState<bool> state) {
              return Row(
                children: [
                  if (state.hasError)
                    const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        final response =
                            await CustomFormSheet.show(state.context);

                        if (state.isValid) return;
                        state.didChange(response ?? false);
                      },
                      child: Text(
                        'read pls',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  )
                ],
              );
            });
}
