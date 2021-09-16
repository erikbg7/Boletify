import 'package:equatable/equatable.dart';
import 'package:futter_project_tfg/models/tag_model.dart';

class Mushroom extends Equatable {
  final String id;
  final String name;
  final String scientificName;
  final String? commonNames;
  final List<Tag> tags;
  final String cap; //sombrero
  final String gills; //himenio
  final String stalk; //pie
  final String flesh; //carne
  final String habitat;
  final String observations;

  const Mushroom({
    required this.id,
    required this.name,
    required this.scientificName,
    this.commonNames,
    required this.tags,
    required this.cap,
    required this.gills,
    required this.stalk,
    required this.flesh,
    required this.habitat,
    required this.observations,
  });

  @override
  List<Object> get props => [
        id,
        name,
        scientificName,
        tags,
        cap,
        gills,
        stalk,
        flesh,
        habitat,
        observations
      ];

  Mushroom copyWith({
    String? id,
    String? name,
    String? scientificName,
    List<Tag>? tags,
  }) {
    return Mushroom(
        id: id ?? this.id,
        name: name ?? this.name,
        scientificName: scientificName ?? this.scientificName,
        tags: tags ?? this.tags,
        cap: this.cap,
        gills: this.gills,
        stalk: this.stalk,
        flesh: this.flesh,
        habitat: this.habitat,
        observations: this.observations);
  }

  factory Mushroom.fromFirestore(Map<String, dynamic> doc) {
    return Mushroom(
      id: doc['id'] ?? '',
      name: doc['name'] ?? '',
      scientificName: doc['scientificName'] ?? '',
      commonNames: doc['commonNames'] ?? '',
      tags: tagsFromJson(doc['tags'] ?? []),
      cap: doc['cap'] ?? '',
      gills: doc['gills'] ?? '',
      stalk: doc['stalk'] ?? '',
      flesh: doc['flesh'] ?? '',
      habitat: doc['habitat'] ?? '',
      observations: doc['observations'] ?? '',
    );
  }

  factory Mushroom.fromJson(Map<String, dynamic> json) {
    return Mushroom(
        id: json['id'],
        name: json['name'],
        scientificName: json['scientificName'],
        commonNames: json['commonNames'],
        tags: tagsFromJson(json['tags']),
        cap: json['cap'],
        gills: json['gills'],
        stalk: json['stalk'],
        flesh: json['flesh'],
        habitat: json['habitat'],
        observations: json['observations']);
  }

  factory Mushroom.buildEmpty(
          {String name = "", scientificName = "", List<Tag> tags = const []}) =>
      Mushroom(
        id: '',
        name: name,
        scientificName: "",
        commonNames: "",
        tags: tags,
        cap: "",
        gills: "",
        stalk: "",
        flesh: "",
        habitat: "",
        observations: "",
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'scientificName': scientificName,
        'commonNames': commonNames,
        'tags': tagsToJson(tags),
        'cap': cap,
        'gills': gills,
        'stalk': stalk,
        'flesh': flesh,
        'habitat': habitat,
        'observations': observations
      };
}