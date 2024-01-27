import 'package:flutter/material.dart';
import 'package:pet_adoption_app/pet/pet.dart';
import 'package:pet_adoption_app/pet/pet_list.dart';

class PetAdoptedScreen extends StatelessWidget {
  final PetList petList;

  const PetAdoptedScreen({Key? key, required this.petList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Pet> adoptedPets = petList.getAdoptedPets();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adopted Pets'),
      ),
      body: ListView(
        children: adoptedPets.map((adoptedPet) {
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Container(
                    height: 120,
                    width: 120,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.blueGrey.shade700,
                    ),
                    child: Image.asset(
                      adoptedPet.petImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      adoptedPet.petName,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF66BB6A)),
                    ),
                    Text(
                      'Age: ${adoptedPet.petAge}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
      /*ListView.builder(
        itemCount: adoptedPets.length,
        itemBuilder: (context, index) {
          Pet adoptedPet = adoptedPets[index];

          return ListTile(
            leading: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(adoptedPet.petImage),
              backgroundColor: const Color(0xFF66BB6A),
            ),
            title: Container(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                adoptedPet.petName,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Age: ${adoptedPet.petAge}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      ),*/
    );
  }
}
