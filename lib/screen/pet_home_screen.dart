import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/cubit/item_cubit.dart';
import 'package:pet_adoption_app/cubit/item_state.dart';
import 'package:pet_adoption_app/pet/pet.dart';
import 'package:pet_adoption_app/pet/pet_list.dart';
import 'package:pet_adoption_app/pet/pet_search_delegate.dart';
import 'package:pet_adoption_app/screen/pet_adopted_screen.dart';
import 'package:pet_adoption_app/screen/pet_detail_screen.dart';

class PetHomeScreen extends StatefulWidget {
  const PetHomeScreen({super.key});

  @override
  State<PetHomeScreen> createState() => _PetHomeScreenState();
}

class _PetHomeScreenState extends State<PetHomeScreen> {
  late ItemCubit itemCubit;

  @override
  void initState() {
    super.initState();
    itemCubit = ItemCubit(PetList());
    itemCubit.fetchPets();
  }

  Widget _buildPetCard(Pet pet) {
    return GestureDetector(
      onTap: () {
        context.read<ItemCubit>().selectPet(pet);
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 2),
            pageBuilder: (context, animation, secondaryAnimation) {
              return const PetDetailScreen();
            },
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: const EdgeInsets.all(10.0),
        color: const Color(0xFF1D1E33),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: pet,
                child: Image.asset(
                  pet.petImage,
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            Text(
              pet.petName,
              style: const TextStyle(
                color: Color(0xFF66BB6A),
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Adoption'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () async {
              final List<Pet>? searchResults = await showSearch(
                context: context,
                delegate:
                    PetSearchDelegate(pets: itemCubit.petList.getPetData()),
              );
              if (searchResults!.isNotEmpty) {}
            },
          ),
          IconButton(
            icon: const Icon(Icons.history),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PetAdoptedScreen(petList: itemCubit.petList),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => itemCubit,
        child: BlocBuilder<ItemCubit, ItemState>(
          builder: (context, state) {
            if (state is LoadedState) {
              return ListView.builder(
                itemCount: (state.pets.length / 2).ceil(),
                itemBuilder: (context, index) {
                  int firstPetIndex = index * 2;
                  int secondPetIndex = firstPetIndex + 1;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (firstPetIndex < state.pets.length)
                        _buildPetCard(state.pets[firstPetIndex]),
                      if (secondPetIndex < state.pets.length)
                        _buildPetCard(state.pets[secondPetIndex]),
                    ],
                  );
                },
              );
            } else {
              return const Text('Implementation issue detected');
            }
          },
        ),
      ),
    );
  }
}
