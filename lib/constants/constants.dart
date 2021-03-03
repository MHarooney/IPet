import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConst {
  static const kAnimationDuration = Duration(milliseconds: 200);

  static const defaultDuration = Duration(milliseconds: 250);

// Form Error
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String kEmailNullError = "Please Enter your email";
  static const String kInvalidEmailError = "Please Enter Valid Email";
  String kPassNullError = "Please Enter your password";
  static const String kShortPassError = "Password is too short";
  static const String kMatchPassError = "Passwords don't match";
  static const String kNamelNullError = "Please Enter your name";
  static const String kPhoneNumberNullError = "Please Enter your phone number";
  static const String kAddressNullError = "Please Enter your address";
  static const String kTest = "Test";

  //Constants Texts
  static const String kNotNowTxt = "Not now!";
  static const String kPrivacyAndPolicyTxt = "Check Privacy & Policy";
  static const String kLoginTo = "Login to";
  static const String kPhoneNoTxt = "Phone number";
  static const String kLoginPhoneNoTxt = "Login with phone number";
  static const String kPleaseEnterPhoneNoTxt = "Please Enter Phone Number";
  static const String kOrTxt = "OR";
  static const String kLoginWithGoogleTxt = "Login with Google";
  static const String kLoginWithFaceBookTxt = "Login with Facebook";
  static const String kLoginWithAppleTxt = "Login with Apple";
  static const String kContinueTxt = "Continue";
  static const String kPhoneCallOrTxtMsg =
      "We will call or text you to confirm your number. \nStandard message and data rates apply.";

  //Assets
  static const String kPrivacyAndPolicyTxtIc = "assets/images/privacy_ic.png";
  static const String kIPetPawIc = "assets/images/ipet_paw_img.png";
  static const String kIPetTxtImg = "assets/images/ipet_text_img.png";
  static const String kFBImg = "assets/icons/fb-ic.png";

  //Fonts
  static const String montserrat = "Montserrat";

  static BoxShadow iPetLoginBoxShadow({Color btnColor}) {
    return BoxShadow(
      color: btnColor,
      spreadRadius: 2,
      blurRadius: 4,
      offset: const Offset(0, 3), // changes position of shadow
    );
  }

  static double getIPetResponsiveHeight(BuildContext context) {
    return MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
  }

  static double getIPetResponsiveWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
