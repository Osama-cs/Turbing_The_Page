import 'package:test/test.dart';
import 'package:individualproject/src/loginpage.dart';

void main() {
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
}
