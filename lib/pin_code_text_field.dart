library pin_code_text_field;

import 'package:flutter/material.dart';

typedef OnDone = void Function(String text);
typedef PinBoxDecoration = BoxDecoration Function(Color borderColor);

class PinCodeTextField extends StatefulWidget {
  final int maxLength;
  final TextEditingController controller;
  final bool hideCharacter;
  final bool highlight;
  final Color highlightColor;
  final Color defaultBorderColor;
  final PinBoxDecoration pinBoxDecoration;
  final String maskCharacter;
  final TextStyle pinTextStyle;
  final OnDone onDone;

  const PinCodeTextField(
      {Key key,
      this.maxLength: 4,
      this.controller,
      this.hideCharacter: false,
      this.highlight: false,
      this.highlightColor,
      this.pinBoxDecoration,
      this.maskCharacter: "\u25CF",
      this.pinTextStyle,
      this.onDone, this.defaultBorderColor: Colors.transparent})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PinCodeTextFieldState();
  }
}

class PinCodeTextFieldState extends State<PinCodeTextField> {
  FocusNode focusNode = new FocusNode();
  String text = "";
  int currentIndex = 0;
  List<String> strList = [];
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.maxLength; i++) {
      strList.add("");
    }

    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (hasFocus) {
                FocusScope.of(context).requestFocus(FocusNode());
                Future.delayed(Duration(milliseconds: 100), () {
                  FocusScope.of(context).requestFocus(focusNode);
                });
              } else {
                FocusScope.of(context).requestFocus(focusNode);
              }
            },
            child: _buildPinCodeRow(context),
          ),
          Container(
            width: 0.1,
            height: 0.1,
            child: TextField(
              focusNode: focusNode,
              controller: widget.controller,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.transparent,
              ),
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                border: InputBorder.none,
              ),
              cursorColor: Colors.transparent,
              maxLength: widget.maxLength,
              onChanged: _onTextChanged,
            ),
          ),
        ],
      ),
    );
  }

  void _onTextChanged(text) {
    setState(() {
      this.text = text;
      if (text.length < currentIndex) {
        strList[text.length] = "";
      } else {
        strList[text.length - 1] =
            widget.hideCharacter ? widget.maskCharacter : text[text.length - 1];
      }
      currentIndex = text.length;
    });
    if (text.length == widget.maxLength) {
      FocusScope.of(context).requestFocus(FocusNode());
      widget.onDone(text);
    }
  }

  Widget _buildPinCodeRow(BuildContext context) {
    List<Widget> pinCodes = List.generate(widget.maxLength, (int i) {
      return _buildPinCode(i, context);
    });

    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        children: pinCodes);
  }

  Widget _buildPinCode(int i, BuildContext context) {
    Color borderColor;
    BoxDecoration boxDecoration;
    if (widget.highlight &&
        hasFocus &&
        (i == text.length ||
            (i == text.length - 1 && text.length == widget.maxLength))) {
      borderColor = widget.highlightColor;
    } else {
      borderColor = widget.defaultBorderColor;
    }
    if (widget.pinBoxDecoration == null) {
      boxDecoration = BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(const Radius.circular(5.0)));
    } else {
      boxDecoration = widget.pinBoxDecoration(borderColor);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        child: Center(child: Text(strList[i], style: widget.pinTextStyle,)),
        decoration: boxDecoration,
        width: 70.0,
        height: 100.0,
      ),
    );
  }
}
