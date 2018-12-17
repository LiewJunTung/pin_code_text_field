import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('he', 'IL'), // Hebrew
        // ... other locales the app supports
      ],
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  String thisText = "";

  bool hasError = false;
  String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pin Code Text Field Example"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Text(thisText, style: Theme.of(context).textTheme.title),
            ),
            PinCodeTextField(
              controller: controller,
              hideCharacter: true,
              highlight: true,
              highlightColor: Colors.blue,
              defaultBorderColor: Colors.black,
              hasTextBorderColor: Colors.green,
              maxLength: 5,
              hasError: hasError,
              maskCharacter: "\u25CF",
              onTextChanged: (text) {
                setState(() {
                  hasError = false;
                });
              },
              pinBoxDecoration: ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
              pinTextStyle: TextStyle(fontSize: 30.0),
              pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
              pinTextAnimatedSwitcherDuration: Duration(milliseconds: 500),
            ),
            Visibility(
              child: Text(
                "Wrong PIN!",
                style: TextStyle(color: Colors.red),
              ),
              visible: hasError,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("SUBMIT"),
                    onPressed: () {
                      setState(() {
                        this.thisText = controller.text;
                      });
                    },
                  ),
                  MaterialButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text("SUBMIT Error"),
                    onPressed: () {
                      setState(() {
                        this.hasError = true;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
