# pin_code_text_field

A widget for entering pin code

## Installation
```yaml
dependencies:
    pin_code_text_field: 0.0.1
```


## Usage
```dart
...
Column(
  children: <Widget>[
    PinCodeTextField(controller: controller, hideCharacter: true, highlight: true, highlightColor: Colors.blue, maxLength: 5,),
    RaisedButton(onPressed: (){
      setState(() {
        this.thisText = controller.text;
      });

    }),
    Text(thisText)
  ],
  ...

```
