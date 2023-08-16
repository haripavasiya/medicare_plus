import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:medicare_plus/view/screen/services/services_screen.dart';

import '../../../model/parking_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../notification/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.WHITE,
        body: Column(
          children: [
            SizedBox(height: AppConstants.itemWidth*0.02,),
            Row(
              children: [
                SizedBox(width: AppConstants.itemWidth*0.03,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Hi, Roni",style: montserratSamiBold.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.05),),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image.asset(Images.ic_hi,width: 25,height: 25,),
                          )
                        ],
                      ),
                      Text("How are you feeling today?",style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen(),)),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(Images.ic_notification,width: 25,height: 25,),
                  ),
                ),
                SizedBox(width: AppConstants.itemWidth*0.03,),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
                child: Column(
                  children: [
                    SizedBox(height: AppConstants.itemHeight*0.01,),
                    Image.asset(Images.img_home_slider, width: AppConstants.itemWidth),
                    SizedBox(height: AppConstants.itemHeight*0.01,),

                    // Search
                    Container(
                      decoration: BoxDecoration(
                          color: ColorResources.WHITE,
                          borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.1),
                          boxShadow: [
                            BoxShadow(
                                color: ColorResources.BLACK.withOpacity(0.1),
                                blurRadius: 1
                            )
                          ]
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02),
                      child: Row(
                        children: [
                          SizedBox(width: AppConstants.itemWidth*0.04,),
                          Expanded(
                            child: Text("Search...",
                                textAlign: TextAlign.start,
                                style: montserratRegular.copyWith(
                                  color: ColorResources.BLACK.withOpacity(0.5),
                                  fontSize: AppConstants.itemWidth*0.04,
                                )),
                          ),
                          SizedBox(width: AppConstants.itemWidth*0.03,),
                          Image.asset(Images.ic_search,width: 20,height: 20,),
                          SizedBox(width: AppConstants.itemWidth*0.03,),
                        ],
                      ),
                    ),

                    // Our Category
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text("Category",
                                style: montserratRegular.copyWith(
                                  color: ColorResources.BLACK,
                                  fontSize: AppConstants.itemWidth*0.045,
                                )),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicesListScreen(),)),
                            child: Text("See More",
                                style: montserratRegular.copyWith(
                                  color: ColorResources.COLOR_PRIMERY,
                                  fontSize: AppConstants.itemWidth*0.035,
                                )),
                          )
                        ]),
                    SizedBox(height: AppConstants.itemHeight*0.01,),

                    // Category List
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: ServiceView("Cardiologist", Color(0xFFFFAE99), Color(0xFFFF7854), Images.ic_cardiologist),
                          ),
                        ),
                        SizedBox(width: AppConstants.itemWidth*0.02,),
                        Expanded(
                          child: GestureDetector(
                            child: ServiceView("Orthopedic", Color(0xFF68EEBE), Color(0xFF30D99C), Images.ic_orthopedic),
                          ),
                        ),
                        SizedBox(width: AppConstants.itemWidth*0.02,),
                        Expanded(
                          child: GestureDetector(
                            child: ServiceView("Dentist", Color(0xFFFDD497), Color(0xFFFDA725), Images.ic_dentist),
                          ),
                        ),
                        SizedBox(width: AppConstants.itemWidth*0.02,),
                        Expanded(
                          child: GestureDetector(
                            child: ServiceView("Ophthalmology", Color(0xFF948BFF), Color(0xFF4133E8), Images.ic_ophthalmology),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppConstants.itemHeight*0.01,),

                    // Our Services
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text("Tops Doctor’s For You",
                                style: montserratRegular.copyWith(
                                  color: ColorResources.BLACK,
                                  fontSize: AppConstants.itemWidth*0.045,
                                )),
                          ),
                          Text("See More",
                              style: montserratRegular.copyWith(
                                color: ColorResources.COLOR_PRIMERY,
                                fontSize: AppConstants.itemWidth*0.035,
                              ))
                        ]),
                    SizedBox(height: AppConstants.itemHeight*0.01,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceView extends StatelessWidget {
  String title,img;
  Color startColor,endColor;
  ServiceView(this.title,this.startColor,this.endColor,this.img,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                startColor,
                endColor,
              ],
            ),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: Image.asset(img,width: 50,height: 50),
        ),
        Text(title,
            style: montserratRegular.copyWith(
              color: ColorResources.BLACK,
              fontSize: AppConstants.itemWidth*0.03,
            )),
      ],
    );
  }
}
