import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/cubit/item_cubit.dart';
import 'package:pet_adoption_app/pet/pet_list.dart';
import 'package:pet_adoption_app/screen/pet_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemCubit(PetList()),
      child: MaterialApp(
        title: 'Pet Adoption Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF0A0E21),
            //backgroundColor: Color(0xFF0A0E21),
          ),
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
          //scaffoldBackgroundColor: const Color(0xFF0A0E21),
        ),
        home: const PetHomeScreen(),
      ),
    );
  }
}
