[![Pub](https://img.shields.io/pub/v/pin_code_text_field.svg)](https://pub.dartlang.org/packages/pin_code_text_field)
<a href="https://stackoverflow.com/questions/tagged/flutter?sort=votes">
   <img alt="Awesome Flutter" src="https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat-square" />
</a>
# pin_code_text_field

It's a Flutter widget for entering pin code. Suitable for use cases such as login and OTP.

# Usage
## Use this package as a library
1. Depend on it
Add this to your package's pubspec.yaml file:
```
dependencies:
  pin_code_text_field: ^1.2.1
```
2. Install it
You can install packages from the command line:
with Flutter:
```
$ flutter packages get
```
Alternatively, your editor might support flutter packages get. Check the docs for your editor to learn more.

3. Import it
Now in your Dart code, you can use:
```
import 'package:pin_code_text_field/pin_code_text_field.dart';
```
## API
| name | type | default | description |
| --- | --- | --- | --- |
| isCupertino | bool | false | Application wrapped in `CupertinoApp` instead `MaterialApp` |
| maxLength | int | 4 | The total length of pin number & the number of pin boxes. |
| hideCharacter | bool | false | Show or hide the pin code. |
| highlight | bool | false | highlight the focused pin box. |
| highlightColor | Color | Colors.black | Set color of the focused pin box. |
| pinBoxDecoration | BoxDecoration| ProvidedPinBoxDecoration._defaultPinBoxDecoration | Customization for the individual pin boxes. Check `ProvidedPinBoxDecoration` for possible options. |
| pinTextStyle | TextStyle | | TextStyle for styling pin characters. |
| maskCharacter | String | "\u25CF" | Special character to mask the pin code. Will only work if `hideCharacter` is set to `true`. |
| pinBoxHeight | double | 70.0 | Height of pin boxes. |
| pinBoxWidth | double | 70.0 | Width of pin boxes. |
| onDone | void Function(String) | | Callback when the max length of pin code is reached. |
| hasTextBorderColor | Color | Colors.black | Set color of pin box containing text. |
| pinTextAnimatedSwitcherTransition | Function(Widget child, Animation<double> animation) | | Animation of text appearing/disappearing, you can write your own or use a few presets: 1. PinCodeTextField.awesomeTransition 2. PinCodeTextField.defaultScalingTransition  3. PinCodeTextField.defaultRotateTransition|
| pinTextAnimatedSwitcherDuration | Duration | const Duration() | Duration of pinTextAnimatedSwitcherTransition. Check `ProvidedPinBoxTextAnimation` for possible options. |
| errorBorderColor | Color | Colors.red | Highlight all textboxes to this color if hasError is set to `true`
| onTextChange | Function(String) | | callback that returns a text on input |
| hasError | bool | false | set all border color to `errorBorderColor` |
| autofocus | bool | false | Autofocus on view entered |
| wrapAlignment | WrapAlignment | WrapAlignment.start | Alignment of the wrapped pin boxes |
| pinCodeTextFieldLayoutType | PinCodeTextFieldLayoutType | PinCodeTextFieldLayoutType.NORMAL | Auto adjust width with `PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH`, wrap the pin box row with `PinCodeTextFieldLayoutType.WRAP` |

## Example
```dart

class MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  String thisText = "";
  int pinLength = 4;

  bool hasError = false;
  String errorMessage;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pin Code Text Field Example"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Text(thisText, style: Theme.of(context).textTheme.title),
              ),
              PinCodeTextField(
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
                onDone: (text){
                  print("DONE $text");
                },
                pinCodeTextFieldLayoutType: PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH,
                wrapAlignment: WrapAlignment.start,
                pinBoxDecoration: ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                pinTextStyle: TextStyle(fontSize: 30.0),
                pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
                pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

```

## Wishlist
1. ~~Localization (L-R, R-L)~~
2. Highlight animation
3. Pin Box animation

## Contributors
1. [Liew Jun Tung](https://github.com/LiewJunTung)
2. [Serge Shkurko](https://github.com/SergeShkurko)
3. [Angga Dwi Arifandi](https://github.com/blackmenthor)

Star 🌟 to show support!

<img src="https://raw.githubusercontent.com/LiewJunTung/Pin-Code-Text-Field/master/image/phoneusage.gif" alt="pin usage" width="250"/>
<img src="https://raw.githubusercontent.com/LiewJunTung/Pin-Code-Text-Field/master/image/ipad.gif" alt="pin usage" width="500"/>

## More information
[Pub package](https://pub.dartlang.org/packages/pin_code_text_field)
[Flutter documentation](https://flutter.io/).
