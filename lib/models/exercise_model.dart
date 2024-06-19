
class Exercise {
  final int id;
  final String exerciseName;
  final String exerciseImageUrl;
  final int noOfMinutes;
   bool completed;

  Exercise({
    required this.id,
    required this.exerciseName,
    required this.exerciseImageUrl,
    required this.noOfMinutes,
    required this.completed,
  });
}