import 'equipment_model.dart';
import 'exercise_model.dart';

class User {
  final String userId;
  final String fullName;
  final String gender;
  final String address;
  final int age;
  final String description;
  int totalExercisesCompleted = 0;
  int totalEquipmentHandOver = 0;

  final List<Exercise> exerciseList;
  final List<Equipment> equipmentList;

  final List<Exercise> favExerciseList;
  final List<Equipment> favEquipmentList;

  User({
    required this.userId,
    required this.fullName,
    required this.gender,
    required this.address,
    required this.age,
    required this.description,
    required this.exerciseList,
    required this.equipmentList,
    required this.favExerciseList,
    required this.favEquipmentList,
    this.totalExercisesCompleted = 0,
    this.totalEquipmentHandOver = 0,
  });

//Exercise Add and Remove methods
  void addExercise(Exercise exercise) {
    exerciseList.add(exercise);
  }

  void removeExercise(Exercise exercise) {
    exerciseList.remove(exercise);
  }

  void removeFavExercise(Exercise exercise) {
    favExerciseList.remove(exercise);
  }

  void addFavExercise(Exercise exercise) {
    favExerciseList.add(exercise);
  }

  //Equipment Add and Remove methods
  void removeFavEquipment(Equipment equipment) {
    favEquipmentList.remove(equipment);
  }

  void addFavEquipment(Equipment equipment) {
    favEquipmentList.add(equipment);
  }

  void addEquipment(Equipment equipment) {
    equipmentList.add(equipment);
  }

  void removeEquipment(Equipment equipment) {
    equipmentList.remove(equipment);
  }

  // Calculation of Total minutes spend

  int calculateTotalMinutesSpend() {
    int totalMinutesSpend = 0;
    for (Exercise exercise in exerciseList) {
      totalMinutesSpend += exercise.noOfMinutes;
    }
    for (Equipment equipment in equipmentList) {
      totalMinutesSpend += equipment.noOfMinutes;
    }
    return totalMinutesSpend;
  }

  void completedExercise(int exerciseId) {
    final exercise =
        exerciseList.firstWhere((exercise) => exercise.id == exerciseId);
    exercise.completed = true;
    removeExercise(exercise);
    totalExercisesCompleted++;
  }

  void handOverEquipment(int equipmentId) {
    final equipment =
        equipmentList.firstWhere((element) => equipmentId == equipmentId);
    equipment.handOver = true;
    removeEquipment(equipment);
    totalEquipmentHandOver++;
  }

  double totalCaloriesBurnedCalculation() {
    double totalCaloriesBurned = 0;
    for (var equipment in equipmentList) {
      totalCaloriesBurned += equipment.noOfCalories;
    }
    if (totalCaloriesBurned > 0 && totalCaloriesBurned <= 10) {
      totalCaloriesBurned = totalCaloriesBurned / 10;
    }
    if (totalCaloriesBurned > 10 && totalCaloriesBurned <= 100) {
      totalCaloriesBurned = totalCaloriesBurned / 100;
    }
    if (totalCaloriesBurned > 100 && totalCaloriesBurned <= 1000) {
      totalCaloriesBurned = totalCaloriesBurned / 1000;
    }
    return totalCaloriesBurned;
  }
}
