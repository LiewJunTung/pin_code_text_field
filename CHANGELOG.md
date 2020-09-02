## [1.7.1]
* Fixed underline color

## [1.7.0]
* Added `hasUnderline` option in pin box.

## [1.6.0]
* Fixed cursor in cupertino, fixed #39, fixed textarea for paste code by [SergeShkurko](https://github.com/LiewJunTung/pin_code_text_field/issues?q=is%3Apr+author%3ASergeShkurko)
* Added highlighted pinBox backgroundColor by [heymars](https://github.com/LiewJunTung/pin_code_text_field/issues?q=is%3Apr+author%3Aheymars)
* Implementation hide default keyboard by [luffynas](https://github.com/LiewJunTung/pin_code_text_field/issues?q=is%3Apr+author%3Aluffynas)

## [1.5.1]
* Implemented `show entire code when pasting` by [MosesMa](https://github.com/LiewJunTung/pin_code_text_field/issues?q=is%3Apr+author%3AMozesMa)

## [1.5.0]
* Fixed WrapAlignment bug
* Web support
* Added ProvidedPinBoxDecoration.roundedPinBoxDecoration
* Updated Examples

## [1.4.0] - 9 September 2019
* Added highlight animation
* Added ability to change keyboard type
* Disallowed special characters when using numeric keyboard.

## [1.3.7] - 16 July 2019
* Fixed #21 - Getting error dispose

## [1.3.6] - 7 May 2019
* Fixed UI error whenever BorderSide color is set to ThemeData for focusedErrorBorder
`errorBorder`, `disabledBorder`, `enabledBorder`

## [1.3.5] - 3 May 2019
* Fixed UI error whenever BorderSide color is set to ThemeData

## [1.3.4] - 24 April 2019
* Fixed pin not showing up when `pinTextAnimatedSwitcherTransition` is set.
* Fixed error when `TextEditingController` is not set

## [1.3.3] - 24 April 2019
* Fixed `TextEditingController can only contain numeric` Error
* Fixed `BoxConstraints has a negative minimum height` Error

## [1.3.2] - 16 April 2019
* `TextEditingController` to set initial text to the `PinCodeTextField`
* `PinCodeTextField` will reflect changes made in `TextEditingController`


## [1.3.0] - 26 March 2019
* Added supports run in `CupertinoApp`. For usage set property `isCupertino: true`
* Fixed a bug where focusNode is not disposed whenever parent widget is disposed

## [1.2.1] - 6 March 2019
* Added `PinCodeTextFieldLayoutType` to adjust type of layouts such as 
auto adjust width or wrap 

## [1.2.0] - 5 March 2019
* Use `Wrap` instead of `Row` to display the Pin boxes


## [1.1.3] - 29 January 2019
* Added `autofocus` property

## [1.1.2] - 17 December 2018
* Refactored provided `PinBoxDecoration` to `ProvidedPinBoxDecoration`
* Refactored provided `PinBoxTextAnimation` to `ProvidedPinBoxTextAnimation`

## [1.1.1] - 15 December 2018
* minor bug fix

## [1.1.0] - 15 December 2018
Added customizable animation on texts
* added errorBorderColor
* added hasTextBorderColor
* added onTextChanged
* added pinTextAnimatedSwitcherTransition
* added pinTextAnimatedSwitcherDuration

## [1.0.0] - 11 December 2018
* Added a few text properties
    * maskCharacter
    * pinCodeTextStyle

## [0.1.1] - 16 October 2018

* First release of plugin

## [0.0.3] - 16 October 2018
* Update with customizable BoxDecorator