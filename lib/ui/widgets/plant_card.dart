import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plants_app/models/plants_model.dart';
import 'package:plants_app/resources/colors/app_colors.dart';
import 'package:plants_app/ui/screens/details_screen.dart';

class PlantCard extends StatefulWidget {
  const PlantCard({super.key});

  @override
  State<PlantCard> createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard> {
  final List<PlantsModel>  _plantList = PlantsModel.plantList;

  //check  favourite or not
  bool toggleIsFavourite (bool isFavourite) {
    return !isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _plantList.length,
        separatorBuilder: (_,__){
          return const SizedBox(width: 15);
        },
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context, PageTransition(
                  child:  DetailsScreen(
                    plantId: _plantList[index].plantId,
                  ),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            },
            child: Container(
              width: 200,
              decoration:  BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  // 1st image show....
                  SizedBox(
                    height: 240,
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(_plantList[index].imageURL),
                    ),
                  ),

                  // 2nd Favourite icon  show....
                  Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: IconButton(
                          onPressed: (){
                            bool result = toggleIsFavourite(
                                _plantList[index].isFavourite
                            );
                            _plantList[index].isFavourite = result;
                            setState(() {});
                          },
                          icon: Icon(
                            _plantList[index].isFavourite == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: AppColors.primaryColor,
                            size: 25,
                          ),
                        ),
                      )
                  ),

                  // 3rd Category and plant name show....
                  Positioned(
                    bottom: 15,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _plantList[index].category,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          _plantList[index].plantName,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 4th price show....
                  Positioned(
                    right: 10,
                    bottom: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        // r'$' + _plantList[index].price.toString(),
                        "\$${_plantList[index].price}",
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
