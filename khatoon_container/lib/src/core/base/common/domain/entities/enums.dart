enum State {
  success(200),
  movedPermanently(301),
  found(302),
  internalServerError(500);

  const State(this.code);

  final int code;
}

enum UseCaseState { success, failure }

enum InvoiceType {
  sale('فروش'),
  buy('خرید');

  const InvoiceType(this.name);

  final String name;
}

enum FieldType {
  textInput('textInput'),
  multiLineTextInput('multiLineTextInput'),
  numInput('numInput'),
  dateInput('dateInput'),
  priceInput('priceInput'),
  passwordInput('passwordInput'),
  standardDropDown('standardDropDown'),
  animateDropDown('animateDropDown'),
  avatarDropDown('avatarDropDown'),
  moreVetDropDown('moreVetDropDown'),
  secondaryDropDown('secondaryDropDown'),
  standardPicker('standardPicker'),
  imagePicker('imagePicker'),
  tagPicker('tagPicker'),
  timePicker('tagPicker'),
  countPicker('countPicker'),
  documentPicker('documentPicker'),
  standardSlider('standardSlider'),
  standardRadioButton('standardRadioButton'),
  animateRadioButton('animateRadioButton'),
  standardCheckBox('standardCheckBox'),
  animateCheckBox('animateCheckBox'),
  standardButton('standardButton');

  const FieldType(this.name);

  final String name;
}
