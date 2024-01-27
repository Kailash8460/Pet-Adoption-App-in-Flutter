import 'package:pet_adoption_app/pet/pet.dart';

abstract class ItemState {}

class InitialState extends ItemState {}

class LoadedState extends ItemState {
  final List<Pet> pets;

  LoadedState(this.pets);
}

class SelectedState extends ItemState {
  final Pet selectedPet;

  SelectedState(this.selectedPet, [setPetAdopt]);
}
