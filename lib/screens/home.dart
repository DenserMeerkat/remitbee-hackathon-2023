import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon_app/api/convert.dart';
import 'package:hackathon_app/widgets/text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  final TextEditingController inputController = TextEditingController();
  final TextEditingController outputController = TextEditingController();

  Country inputCurrency = CountryPickerUtils.getCountryByCurrencyCode('INR');
  Country outputCurrency = CountryPickerUtils.getCountryByCurrencyCode('USD');

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Not a valid amount";
    }
    if (RegExp(r'^\d*\.?\d*$').hasMatch(value)) {
      return null;
    }
    return "Unknown Error";
  }

  void updateInputCurrency(Country value) {
    setState(() {
      inputCurrency = value;
    });
    debugPrint("New Value ${inputCurrency.currencyCode}");
  }

  void updateOutputCurrency(Country value) {
    setState(() {
      outputCurrency = value;
      outputController.text = "";
    });
    debugPrint("New Value ${outputCurrency.currencyCode}");
  }

  void updateOutputText(String val) {
    setState(() {
      outputController.text = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("CurRates"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: 690.h - 100,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                isLoading
                    ? const LinearProgressIndicator(
                        minHeight: 4,
                      )
                    : Container(
                        height: 4,
                      ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "How much would you like to send?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  controller: inputController,
                  validator: validator,
                  labelText: "You send",
                  hintText: "0.0",
                  currency: inputCurrency,
                  currencyUpdate: updateInputCurrency,
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomTextFormField(
                  controller: outputController,
                  readOnly: true,
                  labelText: "You receive",
                  hintText: "0.0",
                  currency: outputCurrency,
                  currencyUpdate: updateOutputCurrency,
                ),
                const Spacer(),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 330.w,
                  ),
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        debugPrint(inputController.text);
                        setState(() {
                          isLoading = true;
                        });
                        String res = await convert(inputCurrency.currencyCode!,
                            outputCurrency.currencyCode!, inputController.text);

                        setState(() {
                          isLoading = false;
                        });
                        debugPrint(res);
                        updateOutputText(res);
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Convert",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
