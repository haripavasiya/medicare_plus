import 'package:flutter/material.dart';
import 'package:medicare_plus/view/screen/dashboard/dashboard_screen.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop:() async{
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen(),));
          return true;
        },
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Container(
                  width: AppConstants.itemWidth,
                  decoration: const BoxDecoration(
                      color: ColorResources.WHITE
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage(Images.ic_like),
                        width: AppConstants.itemWidth * 0.9,
                        height: AppConstants.itemWidth * 0.9,
                      ),
                      Text("Thank You !".toUpperCase(), style: montserratMedium.copyWith(
                          color: ColorResources.COLOR_PRIMERY,
                          fontSize: AppConstants.itemWidth*0.06,
                          fontWeight: FontWeight.w700
                      ),),
                      Text("Your Appointment Successful", style: montserratMedium.copyWith(
                          fontSize: AppConstants.itemWidth*0.04,
                          color: ColorResources.BLACK,
                          fontWeight: FontWeight.w600
                      ),),
                      SizedBox(height: AppConstants.itemHeight*0.02,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.03),
                        child: Text("You booked an appointment with Dr. Pediatrician Purpieson on February 21, at 02:00 PM",
                          textAlign: TextAlign.center,
                          style: montserratMedium.copyWith(
                            fontSize: AppConstants.itemWidth*0.035,
                            color: ColorResources.BLACK,
                            fontWeight: FontWeight.w500
                        ),),
                      ),

                      GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen(),)),
                          child: Text("Done",style: montserratMedium.copyWith(color: ColorResources.COLOR_PRIMERY,fontSize: AppConstants.itemWidth*0.035),)),
                      Text("Go to Home", style: montserratMedium.copyWith(
                          fontSize: AppConstants.itemWidth*0.04,
                          color: ColorResources.COLOR_PRIMERY,
                          fontWeight: FontWeight.w600
                      ),),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}
