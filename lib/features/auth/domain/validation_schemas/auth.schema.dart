import 'package:form_validator/form_validator.dart';

class AuthValidationSchema {
  static final RegExp digitRegExp = RegExp(r'.*[0-9].*');
  static final RegExp lowercaseRegExp = RegExp(r'.*[a-z].*');
  static final RegExp uppercaseRegExp = RegExp(r'.*[A-Z].*');
  static final RegExp specialCharRegExp = RegExp(r'.*[\W_].*');

  static final nameValidator = ValidationBuilder()
      .minLength(3, 'Name must be at least 3 characters long')
      .maxLength(50, 'Name must not exceed 50 characters')
      .required('Name is required')
      .build();

  static final emailValidator = ValidationBuilder()
      .email('Please enter a valid email address')
      .required('Email is required')
      .build();

  static final passwordValidator = ValidationBuilder()
      .minLength(6, 'Password must be at least 6 characters long')
      .required('Password is required')
      .regExp(lowercaseRegExp, 'Password should be atleast have lowercase')
      .regExp(uppercaseRegExp, 'Password should be atleast have uppercase')
      .regExp(digitRegExp, 'Password should be atleast have a number')
      .regExp(specialCharRegExp,
          'Password should be atleast have a special character')
      .build();
}
