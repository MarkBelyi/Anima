// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(phoneNumber) =>
      "We texted you a code to verify your phone number (${phoneNumber}).";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "agreement": MessageLookupByLibrary.simpleMessage(
            "By creating an account you agree to our "),
        "change_password":
            MessageLookupByLibrary.simpleMessage("Change password"),
        "code": MessageLookupByLibrary.simpleMessage("Code"),
        "code_sent_to_phone": m0,
        "dont_have_account":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "enter_password": MessageLookupByLibrary.simpleMessage("Password"),
        "enter_verification_code":
            MessageLookupByLibrary.simpleMessage("Type a code"),
        "forgot_password":
            MessageLookupByLibrary.simpleMessage("Forgot your password?"),
        "forgot_password_title":
            MessageLookupByLibrary.simpleMessage("Forgot password"),
        "have_an_account":
            MessageLookupByLibrary.simpleMessage("Have an account? "),
        "hello_create": MessageLookupByLibrary.simpleMessage(
            "Hello there, create New account"),
        "hello_sign": MessageLookupByLibrary.simpleMessage(
            "Hello there, sign in to continue"),
        "login_successful":
            MessageLookupByLibrary.simpleMessage("Login successful"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "phone": MessageLookupByLibrary.simpleMessage("Phone"),
        "registration_successful":
            MessageLookupByLibrary.simpleMessage("Registration successful"),
        "send": MessageLookupByLibrary.simpleMessage("send"),
        "sign_in": MessageLookupByLibrary.simpleMessage("Sign in"),
        "sign_in_button": MessageLookupByLibrary.simpleMessage("Sign In"),
        "sign_up": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "take_phone_number":
            MessageLookupByLibrary.simpleMessage("Type your phone number"),
        "terms_and_conditions":
            MessageLookupByLibrary.simpleMessage("Terms and Conditions"),
        "verified_code": MessageLookupByLibrary.simpleMessage(
            "We texted you a code to verify your phone number"),
        "welcome_back": MessageLookupByLibrary.simpleMessage("Welcome Back"),
        "welcome_to_us": MessageLookupByLibrary.simpleMessage("Welcome to us,")
      };
}
