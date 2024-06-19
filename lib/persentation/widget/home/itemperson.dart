import 'package:bolc_persons/consts/colors.dart';
import 'package:bolc_persons/data/models/persons.dart';
import 'package:flutter/material.dart';

class ItemPerson extends StatelessWidget {
  final PersonModel personModel;
  const ItemPerson({super.key, required this.personModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding:const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),

      ),
      child: GridTile(
        child: Container(
          color: MyColors.myYellow,
          child:personModel.image!.isNotEmpty?FadeInImage.assetNetwork(
            width: double.infinity,
            height: double.infinity,
            placeholder: 'assets/loading.gif',
             image: personModel.image.toString()):Image.asset("assets/loading.gif")),
            footer: Container(
              width: double.infinity,
              padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(personModel.name.toString(),style: TextStyle(height: 1.3,fontSize: 16,color: MyColors.myWhite,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
            ),
             ),
    );
  }
}