import 'package:flutter/material.dart';
import 'package:plants_app/resources/colors/app_colors.dart';
import 'package:plants_app/ui/widgets/plant_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController searchController = TextEditingController();
  int _selectedIndex = 0;

  //Plants category
  final List<String> _plantTypes = const [
    'Recommended',
    'Indoor',
    'Outdoor',
    'Garden',
    'Supplement',
  ];




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              // 1st search Box......section
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20)
                ),
                child:  TextField(
                  controller: searchController,
                  showCursor: false,
                  decoration: InputDecoration(
                    hintText: "Search plant",
                    prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                    suffixIcon: IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.mic,color: Colors.grey)
                    ),
                    border: InputBorder.none
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // 2nd Plants category types......section
              SizedBox(
                height: 25,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _plantTypes.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: (){
                            _selectedIndex = index;
                            setState(() {});
                          },
                            child: Text(
                              _plantTypes[index],
                              style: TextStyle(
                                fontSize: 15,
                                color: _selectedIndex == index
                                    ? AppColors.primaryColor
                                    : AppColors.blackColor
                                    ,
                                fontWeight:  _selectedIndex == index
                                    ? FontWeight.bold
                                    : FontWeight.w500
                              ),
                            ),
                        ),
                      );
                    },
                ),
              ),
              const SizedBox(height: 20),
              // 3rd plants card ....
              const PlantCard(),

            ],
          ),
        ),
      )
    );
  }
}
