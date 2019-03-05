[![Pub](https://img.shields.io/pub/v/pin_code_text_field.svg)](https://pub.dartlang.org/packages/pin_code_text_field)
<a href="https://stackoverflow.com/questions/tagged/flutter?sort=votes">
   <img alt="Awesome Flutter" src="https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat-square" />
</a>
# pin_code_text_field

It's a Flutter widget for entering pin code. Suitable for use cases such as login and OTP.

# Usage
## API
| name | type | default | description |
| --- | --- | --- | --- |
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

## Example
```dart

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
              onTextChanged: (text) {
                setState(() {
                  hasError = false;
                });
              },
              pinTextStyle: TextStyle(fontSize: 30.0),
              pinTextAnimatedSwitcherTransition: PinCodeTextField.defaultScalingTransition,
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

```

## Wishlist
1. ~~Localization (L-R, R-L)~~
2. Highlight animation
3. Pin Box animation


Star 🌟 to show support!

<img src="https://raw.githubusercontent.com/LiewJunTung/Pin-Code-Text-Field/master/image/phoneusage.gif" alt="pin usage" width="250"/>
<img src="https://raw.githubusercontent.com/LiewJunTung/Pin-Code-Text-Field/master/image/ipad.gif" alt="pin usage" width="500"/>

## More information
[documentation](https://flutter.io/).
