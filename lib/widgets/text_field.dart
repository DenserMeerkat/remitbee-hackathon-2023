import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/currency_picker_dialog.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon_app/constants.dart';
import 'package:hackathon_app/utils/input_utils.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final double maxWidth;
  final bool readOnly;
  final Country currency;
  final void Function(Country) currencyUpdate;
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.currency,
    required this.currencyUpdate,
    this.validator,
    this.labelText,
    this.keyboardType,
    this.hintText,
    this.maxWidth = 330,
    this.readOnly = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  void _openCurrencyPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context),
          child: CurrencyPickerDialog(
              titlePadding: const EdgeInsets.all(8.0),
              searchCursorColor: Colors.pinkAccent,
              searchInputDecoration:
                  const InputDecoration(hintText: 'Search...'),
              isSearchable: true,
              title: const Text('Select your Currency'),
              onValuePicked: (Country country) {
                widget.currencyUpdate.call(country);
              },
              itemBuilder: _buildCurrencyDialogItem),
        ),
      );

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: widget.maxWidth.w),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              color: isDarkMode ? kGrey50 : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: isDarkMode ? kGrey90 : kLGrey40,
              ),
            ),
          ),
          TextFormField(
            readOnly: widget.readOnly,
            controller: widget.controller,
            validator: widget.validator,
            keyboardType: widget.keyboardType ??
                const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              labelText: widget.labelText,
              hintText: widget.hintText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: inputBorder("border", context),
              errorBorder: inputBorder("error", context),
              disabledBorder: inputBorder("disabled", context),
              enabledBorder: inputBorder("enabled", context),
              focusedBorder: inputBorder("focused", context),
              focusedErrorBorder: inputBorder("focusedError", context),
              contentPadding: const EdgeInsets.fromLTRB(16, 16, 100, 16),
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.horizontal(right: Radius.circular(8)),
              child: Container(
                width: 120,
                height: 70,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer),
                child: InkWell(
                  borderRadius:
                      const BorderRadius.horizontal(right: Radius.circular(8)),
                  onTap: _openCurrencyPickerDialog,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 16.0),
                      CountryPickerUtils.getDefaultFlagImage(widget.currency),
                      const SizedBox(width: 8.0),
                      Text(
                        "${widget.currency.currencyCode}",
                        style: const TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 2.0),
                      const Icon(
                        Icons.expand_more_rounded,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCurrencyDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(width: 16.0),
          Text(
            "(${country.currencyCode})",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      );
}
