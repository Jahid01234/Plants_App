import 'package:flutter/material.dart';
import 'package:plants_app/models/plants_model.dart';
import 'package:plants_app/resources/colors/app_colors.dart';

class NewPlantCard extends StatefulWidget {
  const NewPlantCard({super.key});

  @override
  State<NewPlantCard> createState() => _NewPlantCardState();
}

class _NewPlantCardState extends State<NewPlantCard> {
  final List<PlantsModel>  _plantList = PlantsModel.plantList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _plantList.length,
        itemBuilder: (context, index){
          return Container(
            height: 80,
            padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 1st row part
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // 1st stack section(Show image )
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(.8),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      right: 0 ,
                      left: 0 ,
                      bottom: 5 ,
                      child: SizedBox(
                        height: 80,
                        child: Image.asset(_plantList[index].imageURL),
                      ),
                    ),

                    // 2nd category and name section
                    Positioned(
                      left: 90,
                      bottom: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_plantList[index].category,
                            style:  TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.primaryColor.withOpacity(0.5),
                            ),
                          ),
                          Text(_plantList[index].plantName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // 2nd row part
                // 3rd price section
                SizedBox(
                  child: Text(
                    r'$' + _plantList[index].price.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
