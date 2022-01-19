import 'package:flutter_test/flutter_test.dart';
import 'package:individualproject/src/signuppage.dart';

void main() {
  test('Empty name string returns an error', () {
    var result = NameFieldValidator.validate('');

    expect(result, 'Please enter your Full Name');
  });

  test('Name string is accepted', () {
    var result = NameFieldValidator.validate('Osama Ilyas');

    expect(result, null);
  });

  test('Empty email string returns an error', () {
    var result = EmailFieldValidator.validate('');

    expect(result, 'Please enter your Email');
  });

  test('Email string is accepted', () {
    var result = EmailFieldValidator.validate('test@gmail.com');

    expect(result, null);
  });

  test('Empty password string returns an error', () {
    var result = PasswordFieldValidator.validate('');

    expect(result, 'Please enter your Password');
  });

  test('Password string is accepted', () {
    var result = PasswordFieldValidator.validate('Password1');

    expect(result, null);
  });

  test('Confirm password string is accepted', () {
    var result = ConfirmPasswordFieldValidator.validate('');

    expect(result, "Please confirm the password");
  });

  test('Confirm password string is accepted', () {
    var result = ConfirmPasswordFieldValidator.validate('Password1');

    expect(result, null);
  });
}
