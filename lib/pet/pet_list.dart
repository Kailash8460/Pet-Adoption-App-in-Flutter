import 'package:pet_adoption_app/pet/pet.dart';

class PetList {
  late int _petNumber = 0;

  final List<Pet> _petData = [
    Pet(
        pName: 'Buddy',
        pImage: 'assets/images/dog6.png',
        pAge: 2,
        pPrice: 1500,
        pAdopt: 0),
    Pet(
        pName: 'Charlie',
        pImage: 'assets/images/cat4.png',
        pAge: 3,
        pPrice: 2000,
        pAdopt: 0),
    Pet(
        pName: 'Lucy',
        pImage: 'assets/images/dog2.png',
        pAge: 4,
        pPrice: 2500,
        pAdopt: 0),
    Pet(
        pName: 'Milo',
        pImage: 'assets/images/cat8.png',
        pAge: 1,
        pPrice: 1200,
        pAdopt: 0),
    Pet(
        pName: 'Luna',
        pImage: 'assets/images/cat9.png',
        pAge: 2,
        pPrice: 1800,
        pAdopt: 0),
    Pet(
        pName: 'Whiskers',
        pImage: 'assets/images/dog1.png',
        pAge: 1,
        pPrice: 1000,
        pAdopt: 0),
    Pet(
        pName: 'Shadow',
        pImage: 'assets/images/cat1.png',
        pAge: 2,
        pPrice: 1300,
        pAdopt: 0),
    Pet(
        pName: 'Chloe',
        pImage: 'assets/images/cat5.png',
        pAge: 3,
        pPrice: 1700,
        pAdopt: 0),
    Pet(
        pName: 'Simba',
        pImage: 'assets/images/cat3.png',
        pAge: 2,
        pPrice: 1500,
        pAdopt: 0),
    Pet(
        pName: 'Oreo',
        pImage: 'assets/images/dog7.png',
        pAge: 4,
        pPrice: 2000,
        pAdopt: 0),
    Pet(
        pName: 'Rocky',
        pImage: 'assets/images/dog3.PNG',
        pAge: 3,
        pPrice: 1800,
        pAdopt: 0),
    Pet(
        pName: 'Coco',
        pImage: 'assets/images/dog9.png',
        pAge: 2,
        pPrice: 1600,
        pAdopt: 0),
    Pet(
        pName: 'Max',
        pImage: 'assets/images/cat2.png',
        pAge: 4,
        pPrice: 2200,
        pAdopt: 0),
    Pet(
        pName: 'Daisy',
        pImage: 'assets/images/cat10.png',
        pAge: 1,
        pPrice: 1300,
        pAdopt: 0),
    Pet(
        pName: 'Oliver',
        pImage: 'assets/images/dog4.png',
        pAge: 5,
        pPrice: 2500,
        pAdopt: 0),
    Pet(
        pName: 'Mittens',
        pImage: 'assets/images/cat7.png',
        pAge: 2,
        pPrice: 1200,
        pAdopt: 0),
    Pet(
        pName: 'Bella',
        pImage: 'assets/images/cat6.png',
        pAge: 3,
        pPrice: 2000,
        pAdopt: 0),
    Pet(
        pName: 'Leo',
        pImage: 'assets/images/dog5.png',
        pAge: 1,
        pPrice: 1500,
        pAdopt: 0),
    Pet(
        pName: 'Misty',
        pImage: 'assets/images/dog8.png',
        pAge: 4,
        pPrice: 1900,
        pAdopt: 0),
    Pet(
        pName: 'Tiger',
        pImage: 'assets/images/dog10.png',
        pAge: 2,
        pPrice: 1700,
        pAdopt: 0),
  ];

  List<Pet> getPetData() {
    return _petData;
  }

  String getPetName() {
    return _petData[_petNumber].petName;
  }

  String getPetImage() {
    return _petData[_petNumber].petImage;
  }

  int getPetAge() {
    return _petData[_petNumber].petAge;
  }

  int getPetPrice() {
    return _petData[_petNumber].petPrice;
  }

  int getPetAdopt() {
    return _petData[_petNumber].petAdopt;
  }

  void updatePetAdoptStatus(int index, int adoptStatus) {
    if (index >= 0 && index < _petData.length) {
      _petData[index].petAdopt = adoptStatus;
    }
  }

  List<Pet> getAdoptedPets() {
    return _petData.where((pet) => pet.petAdopt == 1).toList();
  }
}
