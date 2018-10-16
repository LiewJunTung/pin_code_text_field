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
      body: Container(
        child: Column(
          children: <Widget>[
            PinCodeTextField(controller: controller, hideCharacter: true,),
            RaisedButton(onPressed: (){
              setState(() {
                this.thisText = controller.text;
              });

            }),
            Text(thisText)
          ],
        ),
      ),
    );
  }

}
