import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterlocale/generated/l10n.dart';
import 'package:flutterlocale/provider/languge_change_provider.dart';
import 'package:flutterlocale/views/home_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: LanguageChangeProvider(),
        ),
      ],
      child: ChangeNotifierProvider<LanguageChangeProvider>(
        create: (context) => LanguageChangeProvider(),
        child: Builder(
          builder: (context) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Localization Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            locale: Provider.of<LanguageChangeProvider>(context).currentLocale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            home: const HomePage(),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
