import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/cubit/item_cubit.dart';
import 'package:pet_adoption_app/cubit/item_state.dart';
import 'package:pet_adoption_app/pet/pet.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PetDetailScreen extends StatelessWidget {
  const PetDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemState>(
      builder: (context, state) {
        if (state is SelectedState) {
          return _buildDetailScreen(
              context, state.selectedPet, context.read<ItemCubit>());
        } else {
          return const Text('Pet not selected');
        }
      },
    );
  }

  Widget _buildDetailScreen(
      BuildContext context, Pet selectedPet, ItemCubit itemCubit) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPet.petName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: selectedPet,
              child: Image.asset(
                selectedPet.petImage,
                height: 350,
                width: 350,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              selectedPet.petName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Color(0xFF66BB6A),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Age: ${selectedPet.petAge}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Price: ₹${selectedPet.petPrice}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Adopted: ${selectedPet.petAdopt == 1 ? 'Yes' : 'No'}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _handleAdoption(selectedPet, itemCubit);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 50),
              ),
              child: Text(
                selectedPet.petAdopt == 1 ? 'Adopted' : 'Adopt',
                style: const TextStyle(
                  fontSize: 30,
                  color: Color(0xFF66BB6A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleAdoption(Pet selectedPet, ItemCubit itemCubit) {
    if (selectedPet.petAdopt == 0) {
      Fluttertoast.showToast(
        msg: 'Adopted the pet',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      itemCubit.adoptState(selectedPet, 1);
    } else {
      Fluttertoast.showToast(
        msg: 'Already adopted',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
