import 'package:medicare_plus/view/screen/auth/sign_up.dart';
import 'package:medicare_plus/view/screen/otp/otp_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../privacy_policy/privacy_policy_screen.dart';
import '../terms_condition/terms_condition_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController mono_Controller =TextEditingController();
  TextEditingController password_Controller =TextEditingController();
  final FocusNode mono_Focus = FocusNode();
  final FocusNode password_Focus = FocusNode();
  bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorResources.COLOR_PRIMERY;
      }
      return ColorResources.COLOR_PRIMERY;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppConstants.itemHeight*0.01,),
            //App logo
            Image.asset(Images.logo_color,width: AppConstants.itemWidth*0.55,height: AppConstants.itemWidth*0.09,fit: BoxFit.fill,),
            SizedBox(height: AppConstants.itemHeight*0.02,),

            //email
            Container(
                margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                decoration: BoxDecoration(
                    color: ColorResources.WHITE,
                    borderRadius:BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurRadius: 1),
                    ]
                ),
                child:Row(
                  children: [
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Image.asset(Images.ic_email,width: 25,height: 25,color: ColorResources.BLACK,),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Expanded(child: TextFormField(
                      controller: mono_Controller,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      focusNode: mono_Focus,
                      keyboardType: TextInputType.number,
                      initialValue: null,
                      textInputAction: TextInputAction.next,
                      style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        hintText: 'Enter Your Email',
                        contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                        isDense: true,
                        counterText: '',
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                        hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                        errorStyle: const TextStyle(height: 1.5),
                        border: InputBorder.none,
                      ),
                    )),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                  ],
                )
            ),
            SizedBox(height: AppConstants.itemHeight*0.02,),

            //password
            Container(
                margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                decoration: BoxDecoration(
                    color: ColorResources.WHITE,
                    borderRadius:BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurRadius: 1),
                    ]
                ),
                child:Row(
                  children: [
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Image.asset(Images.ic_password,width: 25,height: 25,color: ColorResources.BLACK,),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Expanded(child: TextFormField(
                      controller: password_Controller,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      focusNode: password_Focus,
                      keyboardType: TextInputType.text,
                      initialValue: null,
                      textInputAction: TextInputAction.done,
                      style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                        isDense: true,
                        counterText: '',
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                        hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                        errorStyle: const TextStyle(height: 1.5),
                        border: InputBorder.none,
                      ),
                    )),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                  ],
                )
            ),
            SizedBox(height: AppConstants.itemHeight*0.005,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgot Password?",
                    textAlign: TextAlign.end,
                    style: montserratMedium.copyWith(
                        color: ColorResources.BLACK,
                        fontSize: AppConstants.itemHeight*0.015)),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child:  RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "By signing you agree to our ",
                        style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.028,color: ColorResources.BLACK)),

                    TextSpan(
                      text: "Privacy Policy",
                      style: montserratMedium.copyWith( fontSize: AppConstants.itemWidth*0.028,color: ColorResources.COLOR_PRIMERY),
                      recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context,MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen(),)),
                    ),

                    TextSpan(
                      text: " and ",
                      style: montserratRegular.copyWith( fontSize: AppConstants.itemWidth*0.028,color: ColorResources.BLACK),),

                    TextSpan(
                      text: "Terms of use",
                      style: montserratMedium.copyWith( fontSize: AppConstants.itemWidth*0.028,color: ColorResources.COLOR_PRIMERY),
                      recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context,MaterialPageRoute(builder: (context) => const TermsConditionScreen(),)),
                    ),
                  ]),
                ),),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.02,),

            //Button
            GestureDetector(
              onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OTP_Screen(),));
              },
              child: Container(
                width: AppConstants.itemWidth,
                margin: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.02,horizontal: AppConstants.itemWidth*0.13),
                padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.035),
                decoration: BoxDecoration(
                  color: ColorResources.COLOR_PRIMERY,
                  borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.3),
                ),
                child: Text("Log In",textAlign: TextAlign.center,style: montserratRegular.copyWith(color: ColorResources.WHITE,fontSize: AppConstants.itemWidth*0.04)),
              ),
            ),
            SizedBox(height: AppConstants.itemHeight*0.005,),

            //Create Account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create a new account ? ",style: montserratRegular.copyWith(color: ColorResources.BLACK.withOpacity(0.5),fontSize: AppConstants.itemWidth*0.035),),
                GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_Up_Screen(),)),
                    child: Text("Sign Up",style: montserratRegular.copyWith(color: ColorResources.COLOR_PRIMERY,fontSize: AppConstants.itemWidth*0.035),))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
