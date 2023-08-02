import 'dart:async';
import 'package:flutter/material.dart';
import '../Helpers/Database_helper.dart';
import '../data/Animal_Bio_App_Initial_Data.dart';
import '../models/App_model.dart';

class AnimalData extends StatefulWidget {
  const AnimalData({Key? key}) : super(key: key);

  @override
  State<AnimalData> createState() => _AnimalDataState();
}

class _AnimalDataState extends State<AnimalData> {

  late Future<List<Animal>> futureAnimalData;

  @override
  initState(){
    super.initState();
    print(selectedAnimalType!.tableName);
    futureAnimalData = initProcess();
  }

  Future<List<Animal>> initProcess() async {
    List<Animal> animalData = await  DBHelper.dbHelper.fetchData();
    if(animalData.isEmpty){
      List res = animals.map((e) async {
        return await DBHelper.dbHelper.insertData(name: e.name, description: e.description, image: e.image, type: e.type);
      }).toList();
      animalData =  await  DBHelper.dbHelper.fetchData();
      return DBHelper.dbHelper.fetchData();
    }
    return DBHelper.dbHelper.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,),
          onPressed: (){
            Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
          },
        ),
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: const Text("Animal Biography"),
      ),
      body: FutureBuilder(
        future: futureAnimalData,
        builder: (BuildContext context, AsyncSnapshot<List<Animal>> snapshot){
          if(snapshot.hasError){
            return Center(child: Text("ERROR : ${snapshot.error}"),);
          } else if(snapshot.hasData){
            return Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(selectedAnimalType!.bgImage),
                        fit: BoxFit.cover,
                      )
                  ),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.white,
                              Colors.transparent,
                            ]
                        )
                    ),
                  ),
                ),
                ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 80,width: double.infinity,),
                    Text("${selectedAnimalType!.tableName} \nAnimal",textAlign: TextAlign.center, style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 30),),
                    const SizedBox(height: 80,),
                    SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                      physics: const  BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: animals.map((e) => (e.type==selectedAnimalType!.tableName)?Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: 370,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black87, width: 2 ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.20),
                                  offset: const Offset(0,0),
                                  blurRadius: 5,
                                  spreadRadius: 3,
                                )
                              ]
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(e.image),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(e.name,style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                                      const SizedBox(height: 10,),
                                      Text(e.description,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ):Container(),).toList(),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(left: 20,top: 30, bottom: 10),
                        child: Text("View Other Animals",style: TextStyle(color: Colors.black, fontSize: 22,fontWeight: FontWeight.w600),)
                    ),
                    Column(
                      children:  animalTypesList.map(
                              (e) => (e == selectedAnimalType)?Container():GestureDetector(
                            onTap: (){
                              selectedAnimalType = e;
                              Navigator.pushNamed(context, "animated");
                            },
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              height: 100,
                              margin: const EdgeInsets.symmetric(vertical:5,horizontal: 20),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 2),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: NetworkImage(e.bgImage),
                                      fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.20),
                                      offset: const Offset(0,0),
                                      blurRadius: 5,
                                      spreadRadius: 3,
                                    )
                                  ]
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(11),bottomRight: Radius.circular(11)),
                                  color: Colors.black.withOpacity(0.50),
                                ),
                                child: Text("${e.tableName} Animal", style: const TextStyle(color: Colors.white,fontSize: 20),),
                              ),
                            ),
                          )
                      ).toList(),
                    )

                  ],
                )
              ],
            );
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}

