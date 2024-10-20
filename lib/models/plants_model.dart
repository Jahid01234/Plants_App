
class PlantsModel {

  final int plantId;
  final int price;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String plantName;
  final String imageURL;
  final String description;
  bool isFavourite;
  bool isSelected;

  PlantsModel({
        required this.plantId,
        required this.price,
        required this.category,
        required this.plantName,
        required this.size,
        required this.rating,
        required this.humidity,
        required this.temperature,
        required this.imageURL,
        required this.description,
        required this.isFavourite,
        required this.isSelected,
  });

  //List of Plants data
  static List<PlantsModel> plantList = [
    PlantsModel(
        plantId: 0,
        price: 22,
        category: 'Indoor',
        plantName: 'Sanseviera',
        size: 'Small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        imageURL: 'assets/images/plant-one.png',
        description:
        'Plants are really important for the planet and for all living things. '
            'Plants absorb carbon dioxide and release oxygen from their leaves, '
            'which humans and other animals need to breathe. Living things need '
            'plants to live - they eat them and live in them. Plants help to clean'
            ' water too.',
        isFavourite: true,
        isSelected: false,
    ),
    PlantsModel(
        plantId: 1,
        price: 11,
        category: 'Outdoor',
        plantName: 'Philodendron',
        size: 'Medium',
        rating: 4.8,
        humidity: 56,
        temperature: '19 - 22',
        imageURL: 'assets/images/plant-two.png',
        description:
        'Plants are really important for the planet and for all living things. '
            'Plants absorb carbon dioxide and release oxygen from their leaves, '
            'which humans and other animals need to breathe. Living things need '
            'plants to live - they eat them and live in them. Plants help to clean'
            ' water too.',
        isFavourite: false,
        isSelected: false,
    ),
    PlantsModel(
        plantId: 2,
        price: 18,
        category: 'Indoor',
        plantName: 'Beach Daisy',
        size: 'Large',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        imageURL: 'assets/images/plant-three.png',
        description:
        'Plants are really important for the planet and for all living things. '
            'Plants absorb carbon dioxide and release oxygen from their leaves, '
            'which humans and other animals need to breathe. Living things need '
            'plants to live - they eat them and live in them. Plants help to clean'
            ' water too.',
        isFavourite: false,
        isSelected: false,
    ),
    PlantsModel(
        plantId: 3,
        price: 30,
        category: 'Outdoor',
        plantName: 'Big Bluestem',
        size: 'Small',
        rating: 4.5,
        humidity: 35,
        temperature: '23 - 28',
        imageURL: 'assets/images/plant-one.png',
        description:
        'Plants are really important for the planet and for all living things. '
            'Plants absorb carbon dioxide and release oxygen from their leaves, '
            'which humans and other animals need to breathe. Living things need '
            'plants to live - they eat them and live in them. Plants help to clean'
            ' water too.',
        isFavourite: false,
        isSelected: false,
    ),
    PlantsModel(
        plantId: 4,
        price: 24,
        category: 'Recommended',
        plantName: 'Big Bluestem',
        size: 'Large',
        rating: 4.1,
        humidity: 66,
        temperature: '12 - 16',
        imageURL: 'assets/images/plant-four.png',
        description:
        'Plants are really important for the planet and for all living things. '
            'Plants absorb carbon dioxide and release oxygen from their leaves, '
            'which humans and other animals need to breathe. Living things need '
            'plants to live - they eat them and live in them. Plants help to clean'
            ' water too.',
        isFavourite: true,
        isSelected: false,
    ),
    PlantsModel(
        plantId: 5,
        price: 24,
        category: 'Outdoor',
        plantName: 'Meadow Sage',
        size: 'Medium',
        rating: 4.4,
        humidity: 36,
        temperature: '15 - 18',
        imageURL: 'assets/images/plant-five.png',
        description:
        'Plants are really important for the planet and for all living things. '
            'Plants absorb carbon dioxide and release oxygen from their leaves, '
            'which humans and other animals need to breathe. Living things need '
            'plants to live - they eat them and live in them. Plants help to clean'
            ' water too.',
        isFavourite: false,
        isSelected: false,
    ),
    PlantsModel(
        plantId: 6,
        price: 19,
        category: 'Garden',
        plantName: 'Plumbago',
        size: 'Small',
        rating: 4.2,
        humidity: 46,
        temperature: '23 - 26',
        imageURL: 'assets/images/plant-six.png',
        description:
        'Plants are really important for the planet and for all living things. '
            'Plants absorb carbon dioxide and release oxygen from their leaves, '
            'which humans and other animals need to breathe. Living things need '
            'plants to live - they eat them and live in them. Plants help to clean'
            ' water too.',
        isFavourite: false,
        isSelected: false,
    ),
    PlantsModel(
        plantId: 7,
        price: 23,
        category: 'Garden',
        plantName: 'Tritonia',
        size: 'Medium',
        rating: 4.5,
        humidity: 34,
        temperature: '21 - 24',
        imageURL: 'assets/images/plant-seven.png',
        description:
        'Plants are really important for the planet and for all living things. '
            'Plants absorb carbon dioxide and release oxygen from their leaves, '
            'which humans and other animals need to breathe. Living things need '
            'plants to live - they eat them and live in them. Plants help to clean'
            ' water too.',
        isFavourite: false,
        isSelected: false,
    ),
    PlantsModel(
        plantId: 8,
        price: 46,
        category: 'Recommended',
        plantName: 'Tritonia',
        size: 'Medium',
        rating: 4.7,
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/images/plant-eight.png',
        description:
        'Plants are really important for the planet and for all living things. '
            'Plants absorb carbon dioxide and release oxygen from their leaves, '
            'which humans and other animals need to breathe. Living things need '
            'plants to live - they eat them and live in them. Plants help to clean'
            ' water too.',
        isFavourite: false,
        isSelected: false,
    ),
  ];

  //Get the favourited items
  static List<PlantsModel> getFavouritedPlants(){
    List<PlantsModel> _travelList = PlantsModel.plantList;
    return _travelList.where((element) => element.isFavourite == true).toList();
  }

  //Get the cart items
  static List<PlantsModel> addedToCartPlants(){
    List<PlantsModel> _selectedPlants = PlantsModel.plantList;
    return _selectedPlants.where((element) => element.isSelected == true).toList();
  }
}