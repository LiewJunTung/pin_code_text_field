import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 4;
  bool isMaterial = true;
  bool hasError = false;
  String errorMessage;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isMaterial
        ? new MaterialApp(
            title: "Flutter Demo",
            home: materialPin(),
            theme: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF9FA0A5),
                  ),
                ),
              ),
            ),
          )
        : new CupertinoApp(
            title: 'Flutter Demo',
            home: cupertinoPin(),
          );
  }

  changePlatform() {
    setState(() {
      isMaterial = !isMaterial;
    });
  }

  Scaffold materialPin() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material Pin Code Text Field Example"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Text(thisText, style: Theme.of(context).textTheme.title),
              ),
              Container(
                height: 100.0,
                child: PinCodeTextField(
                  autofocus: false,
                  controller: controller,
                  hideCharacter: true,
                  highlight: true,
                  highlightColor: Colors.blue,
                  defaultBorderColor: Colors.black,
                  hasTextBorderColor: Colors.green,
                  maxLength: pinLength,
                  hasError: hasError,
                  maskCharacter: "😎",
                  onTextChanged: (text) {
                    setState(() {
                      hasError = false;
                    });
                  },
                  onDone: (text) {
                    print("DONE $text");
                    print("DONE CONTROLLER ${controller.text}");
                  },
                  pinCodeTextFieldLayoutType:
                      PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH,
                  wrapAlignment: WrapAlignment.start,
                  pinBoxDecoration:
                      ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                  pinTextStyle: TextStyle(fontSize: 30.0),
                  pinTextAnimatedSwitcherTransition:
                      ProvidedPinBoxTextAnimation.awesomeTransition,
                  pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
                ),
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
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("+"),
                      onPressed: () {
                        setState(() {
                          this.pinLength++;
                        });
                      },
                    ),
                    MaterialButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("-"),
                      onPressed: () {
                        setState(() {
                          this.pinLength--;
                        });
                      },
                    ),
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
                    MaterialButton(
                      color: Colors.amber,
                      textColor: Colors.white,
                      child: Text("CHANGE TO CUPERTINO"),
                      onPressed: changePlatform,
                    ),
                    MaterialButton(
                      color: Colors.pink,
                      textColor: Colors.white,
                      child: Text("CLEAR PIN"),
                      onPressed: () {
                        controller.clear();
                      },
                    ),
                    MaterialButton(
                      color: Colors.lime,
                      textColor: Colors.black,
                      child: Text("SET TO 456"),
                      onPressed: () {
                        controller.text = "456";
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  CupertinoPageScaffold cupertinoPin() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Pin Code Text Field Example"),
      ),
      child: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 60.0),
                  child: Text(thisText),
                ),
                PinCodeTextField(
                  autofocus: false,
                  controller: controller,
                  hideCharacter: true,
                  highlight: true,
                  highlightColor: CupertinoColors.activeBlue,
                  defaultBorderColor: CupertinoColors.black,
                  hasTextBorderColor: CupertinoColors.activeGreen,
                  maxLength: pinLength,
                  hasError: hasError,
                  maskCharacter: "🐶",
                  onTextChanged: (text) {
                    setState(() {
                      hasError = false;
                      thisText = text;
                    });
                  },
                  isCupertino: true,
                  onDone: (text) {
                    print("DONE $text");
                  },
                  pinCodeTextFieldLayoutType:
                      PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH,
                  wrapAlignment: WrapAlignment.start,
                  pinBoxDecoration:
                      ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                  pinTextStyle: TextStyle(fontSize: 30.0),
                  pinTextAnimatedSwitcherTransition:
                      ProvidedPinBoxTextAnimation.scalingTransition,
                  pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
                ),
                Visibility(
                  child: Text(
                    "Wrong PIN!",
                    style: TextStyle(color: CupertinoColors.destructiveRed),
                  ),
                  visible: hasError,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: <Widget>[
                      CupertinoButton(
//                      color: Colors.blue,
//                      textColor: Colors.white,
                        child: Text("+"),
                        onPressed: () {
                          setState(() {
                            this.pinLength++;
                          });
                        },
                      ),
                      CupertinoButton(
//                      color: Colors.blue,
//                      textColor: Colors.white,
                        child: Text("-"),
                        onPressed: () {
                          setState(() {
                            this.pinLength--;
                          });
                        },
                      ),
                      CupertinoButton(
//                      color: Colors.blue,
//                      textColor: Colors.white,
                        child: Text("SUBMIT"),
                        onPressed: () {
                          setState(() {
                            this.thisText = controller.text;
                          });
                        },
                      ),
                      CupertinoButton(
//                      color: Colors.red,
//                      textColor: Colors.white,
                        child: Text("SUBMIT Error"),
                        onPressed: () {
                          setState(() {
                            this.hasError = true;
                          });
                        },
                      ),
                      CupertinoButton(
                        child: Text("CHANGE TO MATERIAL"),
                        onPressed: changePlatform,
                      ),
                    ],
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
