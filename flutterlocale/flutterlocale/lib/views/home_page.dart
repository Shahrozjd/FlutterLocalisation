import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterlocale/generated/l10n.dart';
import 'package:flutterlocale/provider/languge_change_provider.dart';
import 'package:flutterlocale/widgets/custom_cupertino.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> locale = ["en", "de"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Localization",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).hello_local,
                style: const TextStyle(color: Colors.black, fontSize: 20)),
            const SizedBox(
              height: 10,
            ),
            Text(S.of(context).change_with_picker,
                style: const TextStyle(color: Colors.black, fontSize: 20)),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomCupertino(
                context,
                children: const [
                  Text("English"),
                  Text("German"),
                ],
                onSelectedItemChange: (value) {
                  // Updating Locale with provider
                  Provider.of<LanguageChangeProvider>(context, listen: false)
                      .changeLocale(locale[value]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
