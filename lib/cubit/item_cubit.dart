import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/cubit/item_state.dart';
import 'package:pet_adoption_app/pet/pet.dart';
import 'package:pet_adoption_app/pet/pet_list.dart';

class ItemCubit extends Cubit<ItemState> {
  final PetList petList;

  ItemCubit(this.petList) : super(InitialState());

  void fetchPets() {
    emit(LoadedState(petList.getPetData()));
  }

  void selectPet(Pet pet) {
    emit(SelectedState(pet));
  }

  void resetState() {
    emit(InitialState());
  }

  void adoptState(Pet pet, int adopt) {
    emit(SelectedState(pet, pet.setPetAdopt(adopt)));
  }
}
