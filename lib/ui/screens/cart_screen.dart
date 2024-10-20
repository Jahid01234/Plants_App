import 'package:flutter/material.dart';
import 'package:plants_app/models/plants_model.dart';
import 'package:plants_app/resources/colors/app_colors.dart';
import 'package:plants_app/ui/widgets/plants_card_by_id.dart';

class CartScreen extends StatefulWidget {
  final List<PlantsModel> addToCartPlants;

  const CartScreen({
    super.key,
    required this.addToCartPlants,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  int calculateTotalPrice() {
    return widget.addToCartPlants.fold(0, (sum, plant) {
      return sum + plant.price;
    });
  }


  @override
  Widget build(BuildContext context) {
    // We use it here, because Recalculate the total price when the widget is updated (e.g., when items are added/removed)
    int totalPrice = calculateTotalPrice();
    return Scaffold(
      body: widget.addToCartPlants.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/add-cart.png",height: 100,),
                  const SizedBox(height: 10,),
                  const Text("Your cart is empty...!",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ) ,
            )
          : Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: widget.addToCartPlants.length,
                    itemBuilder: (context, index){
                      return PlantsCardById(plantList: widget.addToCartPlants, index: index);
                    },
                  ),
                ),
              ),
              // Total Price section
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)
                  ),
                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total price: ",style: TextStyle(
                       color: AppColors.primaryColor,
                       fontSize: 16,
                      fontWeight: FontWeight.bold
                     ),
                    ),
                    Text( "\$$totalPrice",
                      style: const TextStyle(
                        color: Colors.teal,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
