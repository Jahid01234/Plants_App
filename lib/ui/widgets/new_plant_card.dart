import 'package:flutter/material.dart';
import 'package:plants_app/models/plants_model.dart';
import 'package:plants_app/ui/widgets/plants_card_by_id.dart';

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
          return PlantsCardById(plantList: _plantList, index: index,);
        },
      ),
    );
  }
}

