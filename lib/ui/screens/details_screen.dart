import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plants_app/models/plants_model.dart';
import 'package:plants_app/resources/colors/app_colors.dart';
import 'package:plants_app/ui/widgets/plant_feature.dart';

class DetailsScreen extends StatefulWidget {
  final int plantId;
  const DetailsScreen({
    super.key,
    required this.plantId,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  final List<PlantsModel>  _plantList = PlantsModel.plantList;
  //check  favourite or not
  bool toggleIsFavourite (bool isFavourite) {
    return !isFavourite;
  }

  //Toggle add remove from cart
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // 1st stack part- app bar
            Positioned(
              top: 20,
              left: 10,
              right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 1st  cross icon
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),

                    // 2nd favourite icon
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          onPressed: (){
                            bool result = toggleIsFavourite(
                                _plantList[widget.plantId].isFavourite
                            );
                            _plantList[widget.plantId].isFavourite = result;
                            setState(() {});
                          },
                          icon: Icon(
                            _plantList[widget.plantId].isFavourite == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: AppColors.primaryColor,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),

            // 2nd stack part
           Positioned(
             top: 90,
             left: 0,
             right: 0,
             child: SizedBox(
               height: 800,
               child: Stack(
                 children: [
                   // plants size, Humidity, Temperature
                   Positioned(
                       top: 10,
                       right: 20,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           PlantFeature(
                             title:'Size',
                             plantFeature:_plantList[widget.plantId].size,
                           ),
                           PlantFeature(
                             title: 'Humidity',
                             plantFeature:_plantList[widget.plantId].humidity.toString(),
                           ),
                           PlantFeature(
                             title: 'Temperature',
                             plantFeature:_plantList[widget.plantId].temperature,
                           ),

                         ],
                       ),
                   ),
                   // Plants Image
                   Positioned(
                       top: 10,
                       left: 20,
                       child: SizedBox(
                         height: 350,
                         child: Image.asset(_plantList[widget.plantId].imageURL),
                       ),
                   ),
                   // Bottom container part
                   Positioned(
                       left: 0,
                       right: 0,
                       bottom: 0,
                       child: Container(
                         padding: const EdgeInsets.only(
                           top: 60,
                           left: 20,
                           right: 20,
                         ),
                         height: 500,
                         decoration: BoxDecoration(
                           color: AppColors.primaryColor.withOpacity(0.3),
                           borderRadius: const BorderRadius.only(
                             topLeft: Radius.circular(25),
                             topRight: Radius.circular(25),
                           ),
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             // 1st row Name, price, rating part
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 // Show Plant name and price section
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                       _plantList[widget.plantId].plantName,
                                       style: const TextStyle(
                                         color:AppColors.primaryColor,
                                         fontWeight: FontWeight.bold,
                                         fontSize: 25.0,
                                       ),
                                     ),
                                     const SizedBox(
                                       height: 5,
                                     ),
                                     Text(
                                         r'$'+ _plantList[widget.plantId].price.toString(),
                                       style: const TextStyle(
                                         color: AppColors.blackColor,
                                         fontSize: 20,
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                   ],
                                 ),
                                 // show Rating and start icon
                                 Row(
                                   children: [
                                     Text(_plantList[widget.plantId].rating.toString(),
                                       style: const TextStyle(
                                         color: AppColors.primaryColor,
                                         fontSize: 20,
                                         fontWeight: FontWeight.bold
                                       ),
                                     ),
                                     const Icon(
                                       Icons.star,
                                       color: AppColors.primaryColor,
                                       size: 22,
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                             const SizedBox(height: 8),
                             // 2nd Description part
                             SizedBox(
                               height: 180,
                               child: Text(_plantList[widget.plantId].description,
                                 textAlign: TextAlign.justify,
                                 overflow: TextOverflow.clip,
                                 style: TextStyle(
                                   fontSize: 17,
                                   color: AppColors.blackColor.withOpacity(.7),
                                 ),
                               ),
                             ),
                             // add Button section
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 // 1st CART button
                                 Container(
                                   height: 50,
                                   width: 50,
                                   decoration: BoxDecoration(
                                     color:  _plantList[widget.plantId].isSelected == true
                                         ? AppColors.primaryColor.withOpacity(.5)
                                         : Colors.white,
                                     borderRadius: BorderRadius.circular(30),
                                   ),
                                   child: IconButton(
                                     onPressed: (){
                                       bool result = toggleIsSelected(_plantList[widget.plantId].isSelected);
                                       _plantList[widget.plantId].isSelected = result;
                                       setState(() {});
                                     },
                                     icon: Icon(
                                         Icons.shopping_cart,
                                         color: _plantList[widget.plantId].isSelected ==true
                                             ? Colors.white
                                             : AppColors.primaryColor,
                                     ),
                                   ),
                                 ),
                                 // 2nd 'BUY NOW', button
                                 ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor.withOpacity(0.4),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                        )
                                      ),
                                     onPressed: (){},
                                     child: const Text("BUY NOW"),
                                 ),

                               ],
                             )
                           ],
                         ),
                       ),
                   ),
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


