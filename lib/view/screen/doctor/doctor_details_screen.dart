import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medicare_plus/model/doctor_model.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class DoctorDetailsScreen extends StatefulWidget {
  DoctorModel doctorList;
  DoctorDetailsScreen(this.doctorList,{Key? key}) : super(key: key);

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_PRIMERY,
      appBar: AppBar(
        backgroundColor: ColorResources.COLOR_PRIMERY,
        automaticallyImplyLeading: false,
        elevation: 1,
        centerTitle: true,
        actionsIconTheme: const IconThemeData(color: ColorResources.WHITE),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Icon(Icons.arrow_back,color: ColorResources.WHITE,size: 24,)),
        ),
        title: Text("Doctor Details",
            textAlign: TextAlign.center,
            maxLines: 1,
            style: montserratMedium.copyWith(
                color: ColorResources.WHITE,
                fontSize: AppConstants.itemWidth*0.04)),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: AppConstants.itemHeight*0.075),
            child: Column(
              children: [
                Expanded(child: Container(
                  width: AppConstants.itemWidth,
                  decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(AppConstants.itemWidth*0.1),topRight: Radius.circular(AppConstants.itemWidth*0.1))
                  ),
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
                  child: Column(
                    children: [
                      SizedBox(height: AppConstants.itemWidth*0.01,),
                    ],
                  ),
                ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: CachedNetworkImage(
                  height: AppConstants.itemHeight*0.15,
                  imageUrl:widget.doctorList.imageUrl,
                  errorWidget: (context, url, error) => Image.asset(Images.placeholderImages,height: AppConstants.itemHeight*0.1,width: AppConstants.itemHeight*0.15,),
                  progressIndicatorBuilder: (context, url, downloadProgress) => const Center(child: CircularProgressIndicator(color: ColorResources.COLOR_PRIMERY,),),
                  fit: BoxFit.cover,
                  width: AppConstants.itemHeight*0.15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
