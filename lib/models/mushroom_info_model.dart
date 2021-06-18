import 'package:cloud_firestore/cloud_firestore.dart';

import 'mushroom_label_model.dart';

class MushroomInfo {
  final String name;
  final String nameScientific;
  final List<SearchLabels> labels;
  String nameAKA;
  String description;
  String location;
  String season;
  String observations;
  num edibility;

  MushroomInfo(this.name, this.nameScientific, this.labels,
      {this.nameAKA = '',
      this.description = '',
      this.location = '',
      this.season = '',
      this.observations = '',
      this.edibility = 0});

  toConcatString() {
    var labelsString = '';
    labels.forEach((element) {
      labelsString = '$labelsString $element -';
    });
    return '$name, $nameScientific, $labelsString';
  }

  factory MushroomInfo.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data();
    return MushroomInfo(
        data['name'] ?? 'unknown', data['scientificName'] ?? '', []);
  }
}

getMushrooms() {
  final MushroomInfo amanita = new MushroomInfo(
      'Amanita', 'Amanita Muscaria', [],
      nameAKA: '',
      description:
          'Es una seta tóxica que provoca intoxicaciones que se manifiestan al cabo de poco rato de su ingestión (normalmente entre 1 y 4 horas) con trastornos digestivos (diarrea, vómitos, sequedad de boca), aceleración del pulso y trastornos de tipo nervioso: delirio, excitación, alucinaciones, confusión mental.',
      location: 'Boscos rics en hummus',
      season: 'Tardor',
      observations:
          'Como indica su nombre, se puede confundir con el "ou de reig". Las principales diferencias son la presencia de verrugas blancas sobre la capucha del "reig bord" y el color de las láminas y del pie, que son blancas en el "reig bord" y amarilloso en el "ou de reig".',
      edibility: 0);
  final List<MushroomInfo> mushroomDDBB = [];
  mushroomDDBB.add(amanita);
  return mushroomDDBB;
}

List<MushroomInfo> getMushroomsListMock() {
  final List<MushroomInfo> mushroomsList = [];
  mushroomsList.add(MushroomInfo("Cep", "Boletus Edulis", [SearchLabels.summer,SearchLabels.autumn, SearchLabels.edible]));
  mushroomsList.add(MushroomInfo("Rovelló", "Lactarius Sanguifluus", [SearchLabels.autumn,SearchLabels.edible]));
  mushroomsList.add(MushroomInfo("Ou de Reig", "Amanita Caesarea", [SearchLabels.summer,SearchLabels.autumn, SearchLabels.edible]));
  mushroomsList.add(MushroomInfo("Múrgola", "Morchella Rotunda", [SearchLabels.spring, SearchLabels.edible]));
  mushroomsList.add(MushroomInfo("Llanega Negra", "Hygrophorus Latitabundus", [SearchLabels.autumn,SearchLabels.winter, SearchLabels.edible]));
  mushroomsList.add(MushroomInfo("Rossinyol", "Cantharellus Cibarius", [SearchLabels.spring,SearchLabels.summer, SearchLabels.autumn,SearchLabels.winter, SearchLabels.edible]));
  mushroomsList.add(MushroomInfo("Camagroc", "Cantharellus Lutescens", [SearchLabels.autumn,SearchLabels.winter, SearchLabels.edible]));
  mushroomsList.add(MushroomInfo("Amanita", "Amanita Muscaria", [SearchLabels.autumn, SearchLabels.summer, SearchLabels.toxic]));

  return mushroomsList;

}
