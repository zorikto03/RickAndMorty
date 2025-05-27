import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entyties/character.dart';
import 'package:rick_and_morty/presentation/models/location_data_model.dart';

class CharacterInfo extends StatefulWidget {
  final Character character;

  const CharacterInfo({super.key, required this.character});

  @override
  State<StatefulWidget> createState() {
    return _CharacterInfoState();
  }
}

class _CharacterInfoState extends State<CharacterInfo>{

  final LocationDataModel locationsModel = LocationDataModel();

  @override
  Widget build(BuildContext context) {
    return CharacterInfoView(
      character: widget.character, 
      locationsModel: locationsModel);
  }
}


class CharacterInfoView extends StatelessWidget{
  final Character character;
  final LocationDataModel locationsModel;

  const CharacterInfoView({super.key, required this.character, required this.locationsModel});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: LocationDataProvider(
        model: locationsModel,
        child: Builder(builder: (context){
          
          if (locationsModel.location?.name == character.locationName){

            var location = locationsModel.location;
            
            return Column(
              children: [
                SizedBox(
                  height: 350,
                  width: double.infinity,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 150,
                        backgroundImage: NetworkImage(character.image),
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        character.name,
                        style: const TextStyle(fontSize: 20),
                      )
                      // Text(character),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                  width: double.infinity,
                ),
                SizedBox(
                  child: Column(
                    spacing: 20,
                    children: [
                      CharacterInfoParam(
                        paramName: 'Full name', 
                        paramValue: character.name),
                      CharacterInfoParam(
                        paramName: 'Gender',
                        paramValue: character.gender,),
                      CharacterInfoParam(
                        paramName: 'Status', 
                        paramValue: character.status),
                      CharacterInfoParam(
                        paramName: 'Species', 
                        paramValue: character.species),
                      CharacterInfoParam(
                        paramName: 'Location', 
                        paramValue: character.locationName),
                      CharacterInfoParam(
                        paramName: 'Location Type', 
                        paramValue: location?.type ?? 'Empty'),
                      CharacterInfoParam(
                        paramName: 'Location dimension', 
                        paramValue: location?.dimension ?? 'Empty')
                    ],
                  ),
                )
              ],
            );
          }else{
            LocationDataProvider.of(context)?.getByCharacter(character);
            
            return const Center(
                child: CircularProgressIndicator());
          }
        })        
      ),
    );
  }

}


class CharacterInfoParam extends StatelessWidget{
  final String paramName;
  final String paramValue;

  const CharacterInfoParam({
    super.key, 
    required this.paramName, 
    required this.paramValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            paramName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Text(
            paramValue,
            style: const TextStyle(fontSize: 20))
        ],
      ),
    );
  }

}