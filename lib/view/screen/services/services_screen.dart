import 'package:flutter/material.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/app_bar.dart';

class ServicesListScreen extends StatefulWidget {
  const ServicesListScreen({Key? key}) : super(key: key);

  @override
  State<ServicesListScreen> createState() => _ServicesListScreenState();
}

class _ServicesListScreenState extends State<ServicesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: TitleView('Category'), preferredSize: const Size.fromHeight(55)),
      backgroundColor: ColorResources.WHITE,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  child: ServiceView("Cardiologist", Color(0xFFFFAE99), Color(0xFFFF7854), Images.ic_cardiologist),
                ),
              ),
              SizedBox(width: AppConstants.itemWidth*0.03,),
              Expanded(
                child: GestureDetector(
                  child: ServiceView("Orthopedic", Color(0xFF68EEBE), Color(0xFF30D99C), Images.ic_orthopedic),
                ),
              ),
              SizedBox(width: AppConstants.itemWidth*0.03,),
              Expanded(
                child: GestureDetector(
                  child: ServiceView("Dentist", Color(0xFFFDD497), Color(0xFFFDA725), Images.ic_dentist),
                ),
              ),
            ],
          ),
          SizedBox(height: AppConstants.itemWidth*0.03,),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  child: ServiceView("Neurologist", Color(0xFF6AC368), Color(0xFF038E00), Images.ic_neurologist),
                ),
              ),
              SizedBox(width: AppConstants.itemWidth*0.03,),
              Expanded(
                child: GestureDetector(
                  child: ServiceView("Radiologist", Color(0xFF68D6EE), Color(0xFF21B9DA), Images.ic_radiologist),
                ),
              ),
              SizedBox(width: AppConstants.itemWidth*0.03,),
              Expanded(
                child: GestureDetector(
                  child: ServiceView("Surgeon", Color(0xFFFE7E7E), Color(0xFFFD1B1B), Images.ic_surgeon),
                ),
              ),
            ],
          ),
          SizedBox(height: AppConstants.itemWidth*0.03,),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  child: ServiceView("Ophthalmology", Color(0xFF948BFF), Color(0xFF4133E8), Images.ic_ophthalmology),
                ),
              ),
              SizedBox(width: AppConstants.itemWidth*0.03,),
              Expanded(
                child: GestureDetector(
                  child: ServiceView("Pathology", Color(0xFFFF8BF3), Color(0xFFE237D1), Images.ic_pathology),
                ),
              ),
              SizedBox(width: AppConstants.itemWidth*0.03,),
              Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ],
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
          padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.07),
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