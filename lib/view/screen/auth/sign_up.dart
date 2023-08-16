import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../otp/otp_screen.dart';
import '../privacy_policy/privacy_policy_screen.dart';
import '../terms_condition/terms_condition_screen.dart';

class Sign_Up_Screen extends StatefulWidget {
  Sign_Up_Screen();

  @override
  State<Sign_Up_Screen> createState() => _Sign_Up_ScreenState();
}

class _Sign_Up_ScreenState extends State<Sign_Up_Screen> {

  TextEditingController nameControll=TextEditingController();
  TextEditingController mailControll=TextEditingController();
  TextEditingController phoneControll=TextEditingController();
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
            Image.asset(Images.logo,width: AppConstants.itemWidth*0.2,height: AppConstants.itemWidth*0.2,fit: BoxFit.fill,),
            const SizedBox(height: 10,),
            Image.asset(Images.logoHorizontal,width: AppConstants.itemWidth*0.55,height: AppConstants.itemWidth*0.09,fit: BoxFit.fill,),
            SizedBox(height: AppConstants.itemHeight*0.02,),

            //Fill Form
            Container(
              width: AppConstants.itemWidth,
              margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.04),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller:nameControll,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          style: montserratRegular.copyWith(color: ColorResources.BLACK),
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter
                          ],
                          onChanged: (value) {
                            if(value[0]==' '){
                              setState(() {
                                nameControll.text='';
                              });
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Your Full Name",
                            fillColor: ColorResources.TRANSPARENT,
                            hintStyle: montserratRegular.copyWith(color: ColorResources.BLACK.withOpacity(0.8)),
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(thickness: 1,height: 1,color: ColorResources.GREY),
                  SizedBox(height: AppConstants.itemWidth*0.03,),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller:mailControll,
                          textAlign: TextAlign.left,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          style: montserratRegular.copyWith(color: ColorResources.BLACK),
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter
                          ],
                          onChanged: (value) {
                            if(value[0]==''){
                              mailControll.text='';
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: ColorResources.TRANSPARENT,
                            hintText: "Email Address",
                            hintStyle: montserratRegular.copyWith(color: ColorResources.BLACK.withOpacity(0.8)),
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(thickness: 1,height: 1,color: ColorResources.GREY),
                  SizedBox(height: AppConstants.itemWidth*0.03,),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller:phoneControll,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.phone,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.done,
                          style: montserratRegular.copyWith(color: ColorResources.BLACK),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLength: 10,
                          onChanged: (value) {
                            if(value.length==10){
                              AppConstants.closeKeyboard();
                            }
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: ColorResources.TRANSPARENT,
                              hintText: "Mobile Number",
                              hintStyle: montserratRegular.copyWith(color: ColorResources.BLACK.withOpacity(0.8)),
                              filled: true,
                              counterText: ""
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Divider(thickness: 1,height: 1,color: ColorResources.GREY),
                ],
              ),
            ),
            SizedBox(height: AppConstants.itemWidth*0.04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Expanded(child:  RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: <TextSpan>[

                    TextSpan(
                        text: "By signing you agree to our ",
                        style: montserratRegular.copyWith( fontSize: 12,color: ColorResources.BLACK)),

                    TextSpan(
                      text: "Privacy Policy",
                      style: montserratMedium.copyWith( fontSize: 12,color: ColorResources.COLOR_PRIMERY),
                      recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context,MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen(),)),
                    ),

                    TextSpan(
                      text: " and ",
                      style: montserratRegular.copyWith( fontSize: 12,color: ColorResources.BLACK),),

                    TextSpan(
                      text: "Terms of use",
                      style: montserratMedium.copyWith( fontSize: 12,color: ColorResources.COLOR_PRIMERY),
                      recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context,MaterialPageRoute(builder: (context) => const TermsConditionScreen(),)),
                    ),
                  ]),
                ),),
              ],
            ),
            //Button
            GestureDetector(
              onTap:(){
                if(nameControll.text==''){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter user name'),
                        backgroundColor: ColorResources.RED,
                        duration: Duration(seconds: 2),
                      )
                  );
                } else if(mailControll.text==''){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter mail'),
                        backgroundColor: ColorResources.RED,
                        duration: Duration(seconds: 2),
                      )
                  );
                } else if(!AppConstants.isEmail(mailControll.text)){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter valid mail'),
                        backgroundColor: ColorResources.RED,
                        duration: Duration(seconds: 2),
                      )
                  );
                } else if(phoneControll.text==''){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter phone no'),
                        backgroundColor: ColorResources.RED,
                        duration: Duration(seconds: 2),
                      )
                  );
                } else if(phoneControll.text.length!=10){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter valid phone no'),
                        backgroundColor: ColorResources.RED,
                        duration: Duration(seconds: 2),
                      )
                  );
                } else if(!isChecked){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please accept Privacy Policy and Terms of use'),
                        backgroundColor: ColorResources.RED,
                        duration: Duration(seconds: 2),
                      )
                  );
                } else{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OTP_Screen(),));
                }
              },
              child: Container(
                width: AppConstants.itemWidth,
                margin: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.02,horizontal: AppConstants.itemWidth*0.13),
                padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.035),
                decoration: BoxDecoration(
                  color: ColorResources.COLOR_PRIMERY,
                  borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.3),
                ),
                child: Text("Sign Up",textAlign: TextAlign.center,style: montserratRegular.copyWith(color: ColorResources.WHITE,fontSize: AppConstants.itemWidth*0.04)),
              ),
            ),
            SizedBox(height: AppConstants.itemHeight*0.005,),

            //Have an Account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ? ",style: montserratRegular.copyWith(color: ColorResources.BLACK.withOpacity(0.5),fontSize: AppConstants.itemWidth*0.035),),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text("Sign In",style: montserratRegular.copyWith(color: ColorResources.COLOR_PRIMERY,fontSize: AppConstants.itemWidth*0.035),))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
