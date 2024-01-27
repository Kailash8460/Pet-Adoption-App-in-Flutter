import 'package:flutter/material.dart';
import 'package:pet_adoption_app/pet/pet.dart';

class PetSearchDelegate extends SearchDelegate<List<Pet>> {
  final List<Pet> pets;

  PetSearchDelegate({required this.pets});

  Widget _buildPetCard(BuildContext context, Pet pet) {
    return Card(
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
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, []);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    final List<Pet> searchResults = pets
        .where((pet) => pet.petName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return _buildPetCard(context, searchResults[index]);
      },
    );
  }
}
