import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
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
  String thisText = "234235";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TEXT"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PinCodeTextField(
                controller: controller,
                hideCharacter: false,
                highlight: true,
                highlightColor: Colors.blue,
                maxLength: 6,
                defaultBorderColor: Colors.black,
                onDone: (string) => print(string),
              ),
              RaisedButton(onPressed: (){
                // TO TEST AUTO FILL
                setState(() {
                  this.thisText = controller.text;
                });
              }),
              RaisedButton(
                  child: Text("AUTO FILL"),
                  onPressed: (){
                // TO TEST AUTO FILL
                controller.text = "";
                controller.text = controller.text + "1";
                controller.text = controller.text + "2";
                controller.text = controller.text + "3";
                controller.text = controller.text + "4";
                controller.text = controller.text + "5";
                controller.text = controller.text + "6";
                setState(() {
                  this.thisText = controller.text;
                });
              }),
              Text(thisText)
            ],
          ),
        ),
      ),
    );
  }

}
