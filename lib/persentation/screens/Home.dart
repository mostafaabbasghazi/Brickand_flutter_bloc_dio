import 'dart:ffi';

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
  List<PersonModel>?searchPersons;
  bool isLoad=false;
  TextEditingController searchController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<PersonsCubit>(context).getAllPersons();
  }

  Widget searchFiled(){
    return TextField(
      
      controller: searchController,
      cursorColor: MyColors.myGrey,
    decoration:const InputDecoration(
      fillColor: MyColors.myGrey,
      hintText: "Find A Animie Charcter",
      hintStyle: TextStyle(color: MyColors.myGrey,fontSize: 28)
    ),
    style:const TextStyle(color: MyColors.myGrey,fontSize: 28) ,
    onChanged: (value){
      onChangeFunction(value);
    },
    );
  }

  onChangeFunction(String value){
    searchPersons=persons?.where((element)=>element.name!.contains(value)).toList();
    setState(() {
      
    });
  }

  List<Widget> appBarItems(){
    if(isLoad){
      return [
      IconButton(onPressed: (){
        clearController();
        Navigator.pop(context);
      },icon: Icon(Icons.clear,color: MyColors.myGrey,),)
    ];
    }else{
      return [
      IconButton(onPressed: goToSearch,icon: Icon(Icons.search,color: MyColors.myGrey,),)
    ];
    }
  }
  void goToSearch(){
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove:backFromSearch ));
    setState(() {
      isLoad=true;
    });
  }

  void backFromSearch(){
    clearController();
    setState(() {
      isLoad=false;
    });
  }

  void clearController(){
    setState(() {
      searchController.clear();
    });
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
      physics:const ClampingScrollPhysics(),
      itemCount:searchController.text.isEmpty? persons?.length:searchPersons!.length,
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,childAspectRatio: 2/3,
        crossAxisSpacing: 1,mainAxisSpacing: 1),
       itemBuilder: (contex,index){
        return ItemPerson(personModel:searchController.text.isEmpty?persons![index]:searchPersons![index] ,);
       });
  }

  Widget appBarTitle(){
    return  Text("Persons",style: TextStyle(fontSize: 28,color: MyColors.myGrey),);
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        leading: isLoad?BackButton(color: MyColors.myGrey,):Container(),
        title:isLoad?searchFiled():appBarTitle(),
      actions: 
        appBarItems()
      ,
      ),
      body: biuldBlocBiulder(),
    );
  }
}