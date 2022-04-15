//lib>model>gym.dart
class Gym {
  final int id;
  final String title;
  //final String author;
  final String urlImage;
  final String description;
  final String timmings;
  final String address;
  final String sd;
  final String st;
  final String sa;
  final String sc;
  final String category;

  const Gym(
      {required this.id,
      //required this.author,
        required  this.title,
        required this.urlImage,
        required  this.description,
        required this.timmings,
        required  this.address,
        required this.sd,
        required this.st,
        required this.sa,
        required this.sc,
        required this.category});
}
