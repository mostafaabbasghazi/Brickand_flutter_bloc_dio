import 'package:bolc_persons/bussines_logic/cubit/person/persons_cubit.dart';
import 'package:bolc_persons/consts/colors.dart';
import 'package:bolc_persons/data/models/persons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/home/itemperson.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PersonModel>?persons;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    persons=BlocProvider.of<PersonsCubit>(context).getAllPersons();
  }

  Widget biuldBlocBiulder(){
    return BlocBuilder<PersonsCubit,PersonsState>(builder: (context,state){
      if(state is PersonLoaded){
        persons=(state).persons;
        return biuldLoaded();
      }else{
        return Center(
          child: CircularProgressIndicator(color: MyColors.myGrey,),
        );
      }
    });
  }
  Widget biuldLoaded(){
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            listPersons()
          ],
        ),
      ),
    );
  }

  Widget listPersons(){
    return GridView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: persons?.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2/3,crossAxisSpacing: 1,mainAxisSpacing: 1),
       itemBuilder: (contex,index){
        return ItemPerson(personModel:persons![index] ,);
       });
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Persons",style: TextStyle(fontSize: 28,color: MyColors.myWhite),),centerTitle: true,backgroundColor: MyColors.myGrey,),
      body: biuldBlocBiulder(),
    );
  }
}