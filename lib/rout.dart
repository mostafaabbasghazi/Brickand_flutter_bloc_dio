import 'package:bolc_persons/bussines_logic/cubit/person/persons_cubit.dart';
import 'package:bolc_persons/consts/routs_name.dart';
import 'package:bolc_persons/data/models/persons.dart';
import 'package:bolc_persons/data/repository/person.dart';
import 'package:bolc_persons/persentation/screens/Home.dart';
import 'package:bolc_persons/persentation/screens/deatails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRout{
  late PersonRepo personRepo;
  late PersonsCubit personsCubit;

  AppRout(){
    personRepo=PersonRepo();
    personsCubit=PersonsCubit(personRepo);
  }
  Route<dynamic>?  onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case AppRoutName.home:
        return MaterialPageRoute(builder: (_)=>BlocProvider(create: (BuildContext context)=>personsCubit,child: Home(),));

      case AppRoutName.deatails:
        final person=settings.arguments as PersonModel;
        return MaterialPageRoute(builder: (_)=> Deatails(personModel:person ,));
    }

  }
}