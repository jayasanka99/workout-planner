import '../models/equipment_model.dart';

class EquipmentData {
  final List<Equipment> equipmentList = [
    Equipment(
      id: 0,
      equipmentName: "Dumbbells",
      equipmentDescription:
      "A pair of dumbbells for strength training exercises.",
      equipmentImageUrl: "assets/images/equipments/calendar.png",
      noOfMinutes: 30,
      noOfCalories: 2,
      handOver: false,
    ),
    Equipment(
      id: 1,
      equipmentName: "Resistance Bands",
      equipmentDescription: "Elastic bands used for resistance exercises.",
      equipmentImageUrl: "assets/images/equipments/checklist.png",
      noOfMinutes: 20,
      handOver: false,
      noOfCalories: 15,
    ),
    Equipment(
      id: 2,
      equipmentName: "Yoga Mat",
      equipmentDescription: "A mat for practicing yoga and floor exercises.",
      equipmentImageUrl: "assets/images/equipments/dumbbell.png",
      noOfMinutes: 60,
      handOver: false,
      noOfCalories: 30,
    ),
    Equipment(
      id: 3,
      equipmentName: "Jump Rope",
      equipmentDescription:
      "A rope used for cardiovascular exercises and coordination training.",
      equipmentImageUrl: "assets/images/equipments/dumbbells.png",
      noOfMinutes: 15,
      handOver: false,
      noOfCalories: 12,
    ),
    Equipment(
      id: 4,
      equipmentName: "Kettlebells",
      equipmentDescription:
      "Weights with a handle used for strength, endurance, and flexibility training.",
      equipmentImageUrl: "assets/images/equipments/facial-roller.png",
      noOfMinutes: 45,
      handOver: false,
      noOfCalories: 25,
    ),
    Equipment(
      id: 5,
      equipmentName: "Exercise Ball",
      equipmentDescription:
      "A large, inflatable ball used for core and stability exercises.",
      equipmentImageUrl: "assets/images/equipments/stationary-bike.png",
      noOfMinutes: 25,
      handOver: false,
      noOfCalories: 15,
    ),
    Equipment(
      id: 6,
      equipmentName: "Pull-up Bar",
      equipmentDescription:
      "A bar mounted to a wall or doorframe for upper body strength exercises.",
      equipmentImageUrl: "assets/images/equipments/treadmill.png",
      noOfMinutes: 40,
      handOver: false,
      noOfCalories: 20,
    ),
    Equipment(
      id: 7,
      equipmentName: "Medicine Ball",
      equipmentDescription:
      "A heavy ball used for strength and coordination exercises.",
      equipmentImageUrl: "assets/images/equipments/facial-roller.png",
      noOfMinutes: 35,
      handOver: false,
      noOfCalories: 18,
    ),
    Equipment(
      id: 8,
      equipmentName: "Bench",
      equipmentDescription:
      "A stable surface for various strength training exercises.",
      equipmentImageUrl: "assets/images/equipments/dumbbells.png",
      noOfMinutes: 55,
      handOver: false,
      noOfCalories: 28,
    ),
    Equipment(
      id: 9,
      equipmentName: "Barbell",
      equipmentDescription:
      "A long metal bar with weights attached to each end, used for resistance training.",
      equipmentImageUrl: "assets/images/equipments/skipping-rope.png",
      noOfMinutes: 50,
      handOver: false,
      noOfCalories: 27,
    ),
  ];
}