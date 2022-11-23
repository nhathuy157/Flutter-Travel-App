// ignore_for_file: public_member_api_docs, sort_constructors_first
class HotelModel {
  HotelModel({
    required this.hotelImage,
    required this.hotelName,
    required this.location,
    required this.awayKilometer,
    required this.star,
    required this.numberOfRevice,
    required this.price,
  });

  final String hotelImage;
  final String hotelName;
  final String location;
  final String awayKilometer;
  final double star;
  final int numberOfRevice;
  final int price;
}
