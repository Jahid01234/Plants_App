import 'package:flutter/material.dart';
import 'package:plants_app/models/plants_model.dart';
import 'package:plants_app/resources/colors/app_colors.dart';
import 'package:plants_app/ui/widgets/plants_card_by_id.dart';

class FavouriteScreen extends StatefulWidget {
  final List<PlantsModel> favouritePlants;

  const FavouriteScreen({
    super.key,
    required this.favouritePlants,
  });

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: widget.favouritePlants.isEmpty
            ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/favorited.png",height: 100,),
                  const SizedBox(height: 10,),
                  const Text("Your favourites is empty...!",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ) ,
            )
            : Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.favouritePlants.length,
                  itemBuilder: (context, index){
                     return PlantsCardById(plantList: widget.favouritePlants, index: index);
                  },
              ),
            ),
      ),
    );
  }
}
