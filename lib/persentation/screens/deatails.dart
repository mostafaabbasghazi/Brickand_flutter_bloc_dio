import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bolc_persons/consts/colors.dart';
import 'package:bolc_persons/data/models/persons.dart';
import 'package:flutter/material.dart';

class Deatails extends StatelessWidget {
  final PersonModel personModel;
  const Deatails({super.key, required this.personModel});

  @override
  Widget build(BuildContext context) {

    Widget biuldDivider(double endIndent){
      return Divider(
        color: MyColors.myYellow,
        height: 30,
        endIndent:endIndent,
        thickness: 2,
      );
    }

    Widget biuldPersonInfo(String title,String value){
      return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(text: title,style:const TextStyle(color: MyColors.myWhite,fontWeight: FontWeight.bold,fontSize: 18)),
            TextSpan(text: value,style:const TextStyle(color: MyColors.myWhite,fontSize: 16))
          ]
        ));
    }

    Widget biuldSleverAppBar(){
      return SliverAppBar(
        expandedHeight: 600,
        pinned: true,
        stretch: true,
        backgroundColor: MyColors.myGrey,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(personModel.name.toString(),style: TextStyle(color: MyColors.myWhite),),
          background: Hero(
            tag: personModel,
            child: Image.network(personModel.image.toString(),fit: BoxFit.cover,)),

        ),
      );
    }
    return Scaffold(
      backgroundColor: MyColors.myGrey,
     body: CustomScrollView(
      slivers: [
        biuldSleverAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                margin:const EdgeInsetsDirectional.fromSTEB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    biuldPersonInfo("status : ",personModel.status.toString()),
                    biuldDivider(12),
                    SizedBox(height: 20,),
                    biuldPersonInfo("species : ",personModel.species.toString()),
                    biuldDivider(12),
                    SizedBox(height: 20,),
                    biuldPersonInfo("gender : ",personModel.gender.toString()),
                    biuldDivider(12),
                    SizedBox(height: 20,),
                    biuldPersonInfo("created : ",personModel.created.toString()),
                    biuldDivider(12),
                     SizedBox(
  width: double.infinity,
  height: 400,
  child: DefaultTextStyle(
    style: const TextStyle(
      fontSize: 35,
      color: Colors.white,
      shadows: [
        Shadow(
          blurRadius: 7.0,
          color: Colors.white,
          offset: Offset(0, 0),
        ),
      ],
    ),
    child: AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        FlickerAnimatedText('Hello I am ${personModel.name.toString()}'),
        FlickerAnimatedText('My gender is ${personModel.gender.toString()}'),
        FlickerAnimatedText("C'est La Vie !"),
      ],
      onTap: () {
        print("Tap Event");
      },
    ),
  ),
)
                  ],
                ),
              )
            ]
          )
          )
      ],
      ),
    );
  }
}