import 'package:futter_project_tfg/models/mushroom_label_model.dart';

//enum Habitat {}

class MushroomDescription {
  final String name;
  final String sientificName;
  final String commonNames;
  final List<SearchLabels> tags;
  final String cap; //sombrero
  final String gills; //himenio
  final String stalk; //pie
  final String flesh; //carne
  final String habitat;
  final String observations;

  MushroomDescription(
      {this.name,
      this.sientificName,
      this.commonNames,
      this.tags,
      this.cap,
      this.gills,
      this.stalk,
      this.flesh,
      this.habitat,
      this.observations});
}

List<MushroomDescription> getMushroomsListMock() {
  final List<MushroomDescription> mushroomsList = [];
  mushroomsList.add(
    MushroomDescription(
      name: 'Ou de reig',
      sientificName: 'Amanita Caesarea',
      commonNames: '',
      tags: [SearchLabels.spring, SearchLabels.summer, SearchLabels.autumn],
      cap:
          'Puede alcanzar los 20cm, al principio es hemisférico, y luego se despliega; borde estirado y cutícula naranja. Puede presentar restos de la volva membranosa, como escamas o amplias placas.',
      gills:
          'Las láminas están libres y color amarillo oro. Las lamélulas estan intercaladas.',
      stalk:
          'Es de forma cilíndrica, separable del sombrero. Al igual que las láminas, está vestido de un elegante color amarillo. Si nos fijamos en la parte superior del mismo veremos que luce un elegante anillo surcado por canales (velo parcial) mientras que en la base conserva la volva membranosa de  color blanco, que recoge la parte inferior como si se tratara de un saco.',
      flesh:
          'Es compacta, con un destacado color blanco, amarillento bajo la cutícula y al corte en el pie. Tiene un olor y sabor agradable.',
      habitat: 'Bosques planifolios, de castaños y robles.',
      observations:
          'Seta muy apreciada por su gran calidad gastronómica y fácil identificación. En el Imperio Romano estuvo prohibida su recolección, y su incumplimiento era castigado con la pena de muerte.',
    ),
  );

  mushroomsList.add(
    MushroomDescription(
      name: 'Trompeta de la mort',
      sientificName: 'Craterellus Cornucopioides',
      commonNames: 'Rossinyol negre',
      tags: [SearchLabels.summer, SearchLabels.autumn],
      cap:
          'De 3 a 8cm, con forma de trometa, hueco en la base, color negro o mate, fibrilloso y con pequeñas escamas tambien oscuras, margen enrollado, ondulado irregular.',
      gills:
          "Està format per plecs de color gris cendra a gris blavós.",
      stalk:
          "Es cilindric i buit, una continuació del sombrero, atenuat a la base.",
      flesh:
          "Es prima, fràgil, trencadissa, de color gris fosc a negre, de olor agradable i gust dolç.",
      habitat: "Preferentment es troba a fagedes, tot i que es pot trobar a altres tipus de boscos.",
      observations:
          "Es una especie molt abundant, si en trobem un quants es probable que n'hi hagi molts més pels voltants. Es una seta comestible excelent. El seu aspecte negre pot fer-nos sentir respecte a l'hora de probar-la, peró es un bolet deliciòs, el millor del seu génere.",
    ),
  );

  mushroomsList.add(
    MushroomDescription(
      name: "Camagroc",
      sientificName: "Craterellus Lutescens",
      commonNames: "Rossinyolic, trompea groga",
      tags: [SearchLabels.summer, SearchLabels.autumn, SearchLabels.winter],
      cap:
      "De 2 a 6cm, en forma d'embut, lobulat, marró-negrós sobre un fons groc ataronjat, fibrillós i amb petites escates, marge ondulat.",
      gills:
      "Format per rugositats, plcs ben marcats, de color groc ataronjat fins a rosat.",
      stalk:
      "Cílindric, com una continuacío del sombrero, buit ffins a la base, atenuat, del mateix color que l'himeni.",
      flesh:
      "Es prima i frágil, trencadissa, de color crema grogenc, d'olor agradable y sabor dolç.",
      habitat: "Apareix a zones humides, musgoses de pinars de muntanya.",
      observations:
      "En temps humits es molt abundant. La recoleció es laboriosa, ja que cal recollir-los amb molta cura i procurar posar-les netes a la cistella. Es un bolet comestible excelent, amb un aroma inconfundible i molt agradable.",
    ),
  );

  mushroomsList.add(
    MushroomDescription(
      name: "Pinatell",
      sientificName: "Lacttarius Deliciosus",
      commonNames: "Rovelló",
      tags: [SearchLabels.autumn, SearchLabels.winter],
      cap:
      "D'entre 6 i 12 cm, es convex i després extens i deprimir. De color roig-ataronjat, la cutícula es aterciopelada.",
      gills:
      "Les lámines son apretades, poc decurrents i d'un color taronja amb taques verdoses.",
      stalk:
      "És curt, escrobiculado.",
      flesh:
      "Es banquinosa, peró pot variar una mica a color pastanaga al tallar-lo. D'una olor agradable i sabor dolç.",
      habitat: "Es troba als pinars.",
      observations:
      "Comestible. Molt comú i apreciat. Ens desfarem de tots els que segreguin latex blanc o d'un altre color.",
    ),
  );

  mushroomsList.add(
    MushroomDescription(
      name: "",
      sientificName: "",
      commonNames: "",
      tags: [SearchLabels.summer, SearchLabels.autumn],
      cap:
      "",
      gills:
      "",
      stalk:
      "",
      flesh:
      "",
      habitat: "",
      observations:
      "",
    ),
  );

  mushroomsList.add(
    MushroomDescription(
      name: "",
      sientificName: "",
      commonNames: "",
      tags: [SearchLabels.summer, SearchLabels.autumn],
      cap:
      "",
      gills:
      "",
      stalk:
      "",
      flesh:
      "",
      habitat: "",
      observations:
      "",
    ),
  );

  mushroomsList.add(
    MushroomDescription(
      name: "",
      sientificName: "",
      commonNames: "",
      tags: [SearchLabels.summer, SearchLabels.autumn],
      cap:
      "",
      gills:
      "",
      stalk:
      "",
      flesh:
      "",
      habitat: "",
      observations:
      "",
    ),
  );

  mushroomsList.add(
    MushroomDescription(
      name: "",
      sientificName: "",
      commonNames: "",
      tags: [SearchLabels.summer, SearchLabels.autumn],
      cap:
      "",
      gills:
      "",
      stalk:
      "",
      flesh:
      "",
      habitat: "",
      observations:
      "",
    ),
  );



  mushroomsList.add(
    MushroomDescription(
      name: "",
      sientificName: "",
      commonNames: "",
      tags: [SearchLabels.summer, SearchLabels.autumn],
      cap:
      "",
      gills:
      "",
      stalk:
      "",
      flesh:
      "",
      habitat: "",
      observations:
      "",
    ),
  );



  mushroomsList.add(
    MushroomDescription(
      name: "",
      sientificName: "",
      commonNames: "",
      tags: [SearchLabels.summer, SearchLabels.autumn],
      cap:
      "",
      gills:
      "",
      stalk:
      "",
      flesh:
      "",
      habitat: "",
      observations:
      "",
    ),
  );

  // (image with labels)
  // (single child scrollable view)

  // SOMBRERO  (color negre)
  // descripcio extensa del sombrero

  // HIMENI  (color negre)
  // descripció extensa del sombrero


  return mushroomsList;
}
