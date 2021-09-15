import 'package:equatable/equatable.dart';
import 'package:futter_project_tfg/models/tag_model.dart';

class Mushroom extends Equatable {
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
    String? name,
    String? scientificName,
    List<Tag>? tags,
  }) {
    return Mushroom(
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

const List<Mushroom> mushroomsListMock = [
  Mushroom(
    name: 'Ou de reig',
    scientificName: 'Amanita Caesarea',
    commonNames: '',
    tags: [Tag.spring, Tag.summer, Tag.autumn, Tag.edible],
    cap:
        "Pot arribar a medir 20 centímetres, al principi és hemisfèric, i després es desplega; té el marge estriat i la cutícula taronja. Pot presentar restes de la volva membranosa, com escates o àmplies plaques.",
    gills:
        "Les làmines són lliures i de color groc or. Les làmines estan intercalades.",
    stalk:
        "És de forma cilíndrica, separable del barret. A l’igual que les làmines, esta vestit d’un elegant color groc. Si ens fixem en la part superior veurem que llueix un elegant anell surcat per canals (vel parcial) mentres que la base conserva la volva membranosa de color blanc que recull la part inferior com si es tractes d’un sac.",
    flesh:
        "És compacta, amb un color blanc molt pur, groguenc sota la cutícula i al tall en el peu. Té un olor i gust agradable. ",
    habitat: "Boscos planifolis, de castanyers i robles.",
    observations:
        "És un bolet molt apreciat per la seva gran calitat gastronòmica i de fàcil identificació. Durant l’Imperi Romà va estar prohibida la seva recol·lecció, i el seu incompliment era castigat amb la pena de mort.",
  ),
  Mushroom(
    name: "Peu de rata bord",
    scientificName: "Ramaria formosa",
    commonNames: "",
    tags: [Tag.summer, Tag.autumn, Tag.toxic],
    cap:
        "Té forma de corall. Creix fins arribar als 20 x 25 centímetres, amb ramificacions nombroses, apretades, de color rosa salmó i les puntes acabades en U de color groc llimona. El tronc és robust del mateix color que les rames amb la base blanquinosa.",
    gills: "",
    stalk: "",
    flesh:
        "És blanca i compacta en el tronc, al tall s’enfosqueix. És fràgil i trencadissa en les rames, d’olor suau i de gust amarg.",
    habitat: "Naix sota planifolis, amb preferència sota els faigs.",
    observations:
        "És una de les més belles Ramarias, fàcil d’identificar pels seus tres colors: blanc a la base del tronc, rames de color rosa-salmó i les puntes grogues; a la maduresa tot el bolet canvia al color groc més o menys pàlid. Possiblement és el bolet que ha alterat més intestins per les característiques laxants que presenta al ser confosa amb altres ramarias grogues, com la Ramaria flava i Ramaria botrytis, les quals són comestibles. És tòxic, produeix síndrome de latència curta i trastorns gastrointestinals.",
  ),
  Mushroom(
    name: "Peu de rata",
    scientificName: "Ramaria botrytis",
    commonNames: "Coliflor",
    tags: [Tag.summer, Tag.autumn],
    cap:
        "Arriba a medir 20 centímetres, de tronc robust i blanquinós, en forma d’arbust ramificat i/o similar a un corall, amb nombroses rames, que a la vegada s’obren en forma de coliflor, de color blanc o cremós, que es disgreguen en nombroses rametes curtes de color rosa-morat a les puntes. ",
    gills:
        "És amfígen, amb superfície externa de les ramificacions de color blanc-cremós a rosat.",
    stalk: "",
    flesh: "És blanca, compacta, d’olor fúngica i de gust agradable.",
    habitat: "Naix en boscos de planifolis.",
    observations:
        "És una ramaria fàcil de reconéixer amb els exemplars més joves, pel color púrpura o morat de les puntes de les seves ramificacions. Quan maduren, totes les ramarias enfosqueixen i es torna més difícil distingir-les. És tracta d’un bolet comestible i a més a més, excel·lent, però hem de recordar que es possible confondre-la amb altres ramarias que són laxants e inclús indigestes, com és el cas de Ramaria formosa, en la qual les seves puntes són de color groc or.",
  ),
  Mushroom(
    name: "Murgula",
    scientificName: "Morchella elata",
    commonNames: "Arigany",
    tags: [Tag.spring, Tag.edible],
    cap:
        "Arriba a medir els 12 centímetres d’altura i es cònica; les costelles es presenten alineades, unides entre si per anastomosis, formant alvèols irregulars, de color molt variable, des d’un color mel o bru a tota la gama de grisos, amb tons violacis i costelles que ennegreixen amb la maduresa; val·lècula és ampla i poc profunda, amb superfície himenial interna coberta d’escates.",
    gills: "",
    stalk:
        "Creix fins a 10 centímetres, és cilíndric, buit, atenuat a la base, surcat i molt foradat, que evoluciona de blanc a color ocre a la seva maduresa.",
    flesh:
        "Es mostra elàstica, fràgil, trencadissa, d’un color blanc-grisós, i desprén una olor débil fúngica i té un gust dolç agradable.",
    habitat:
        "Naix en diversos tipus de boscos, amb preferència per les coníferes",
    observations:
        "Pot tenir d’un tamany mitjà a gran. Poden sorgir gregàries, aïllades o en grups de varis individus. Prefereixen els boscos de muntanya, en el Pirineu, sota l’avet blanc. Les costelles es troben alineades i la punta mai acaba en punta a diferència d’altres.És un bolet comestible excel·lent. Es recomanable assecar-les i posteriorment rehidratar-les amb llet per disfrutar d’una gran delícia gastro-micológica; farcir-la de lluç, marisc o carn picada és el plat ideal per a qualsevol gourmet.",
  ),
  Mushroom(
    name: "Apagallum",
    scientificName: "Macrolepiota procera",
    commonNames: "Cogomella",
    tags: [Tag.summer, Tag.autumn, Tag.edible],
    cap:
        "Pot arribar a medir 30 centímetres. La superfície esta decorada amb escates marrons disposades en ziga-zaga sobre un fons color crema, anell membranós, doble, amb marges amb forma d’ona, doble, relliscant al llarg del peu.",
    gills: "Les làmines son lliures, amples i apretades, de color crema.",
    stalk:
        "És fibrós, llarg i buit, i es desprén fàcilment del barret. Té la superfície coberta d’escates i un anell doble a la part dalt.",
    flesh:
        "És blanca i elàstica. S’enrogeix amb el contacte amb l’aire. Té olor i gust agradables. ",
    habitat: "Sorgeix en tot tipus de boscos.",
    observations:
        "És tracta comestible excel·lent. Naix d’un ou i es desenvolupa amb el barret tancat, amb forma similar a la d’una baqueta d’un tambó, per al final obrir-se com si fos un paraigües. S’ha d’anar en compte de no confondre’l amb les Lepiotes petites, la majoria d’elles verinoses.",
  ),
  Mushroom(
    name: "Murgula borda",
    scientificName: "Gyromitra esculenta",
    commonNames: "Bolet de greix",
    tags: [Tag.spring, Tag.toxic],
    cap:
        "Arriba a mesurar fins a 6 centímetres d’altura, buida, amb plecs sinuosos amb un aspecte similar a un cervell; la superfície de l’himeni pot ser des d’un color marró a un color bru rogenc, llis brillant i amb el marge enrollat.",
    gills: "",
    stalk:
        "És cilíndric curt, gruixut i buit, freqüentment comprimit, ample a la base, amb plecs profunds, pruïnós, emblanquit, més fosc en la maduresa.",
    flesh:
        "És prima, més fràgil a la mitra que en el peu, emblanquida d’olor fúngic-espermàtic i de gust dolç.",
    habitat:
        "Apareix en grups, és gregaria, en boscos de coníferes de muntanya.",
    observations:
        "Fins fa poc temps era considerat un bolet comestible i era molt apreciada al nord d’Europa, però va produir la mort de varies persones després d’ingerir-les de forma repetida en pocs dies; estudis recents han constatat, que conté elements cancerígens. Totes les Gyromitras són sospitoses de toxicitat, fet per el qual no s’haurien de consumir. No s’ha de confondre-les amb la família de les Morchellas, bolets comestibles excel·lents. Mortal per acumulació dels elements tòxics. ",
  ),
  Mushroom(
    name: "Bolet de tinta",
    scientificName: "Coprinus comatus",
    commonNames: "",
    tags: [Tag.summer, Tag.autumn, Tag.edible],
    cap:
        "Té forma parabòl·lica de 5 a 15 centímetres d’alt; la cutícula és de color blanc i sembla que estigui coberta per barbes o volants. Té un disc central llis, més fosc, i amb el desenvolupament del marge agafa un color rosat i posteriorment es liqua en un líquid negre.",
    gills:
        "Les llàmines són apretades, lliures, rosades i, al final, negres deliqüescents.",
    stalk:
        "És cilíndric, normalment més llarg que el barret en els exemplars més adults, amb un engruiximent bulbós i a vegades radicant, amb un anell lliure i fugaç.",
    flesh:
        "És prima i escassa, d’un color blanc en els primers estadis, que es torna rosat amb l’edat, i negra i deliqüescents en l’etapa final: d’olor agradable i gust dolç.",
    habitat:
        "Apareix en camps i prats, vores de camins, moviments de terra i clarianes de boscos.",
    observations:
        "És molt abundant i tot i que també es presenta en grups de nombrosos individus, és gregaria. Pot semblar una catifa en un gran tros de gespa o en els prats. És un bolet comestible excel·lent, molt delicat, que no soporta cops ni pressions. S’ha de consumir immediatament després de recol·lectar-la, ja que és deteriora molt ràpidament.",
  ),
  Mushroom(
    name: "Moixernó blanc",
    scientificName: "Clitopilus prunulus",
    commonNames: "",
    tags: [Tag.summer, Tag.autumn, Tag.edible],
    cap:
        "De 3 a 10 centímetres, de consistència molt fràgil; amb forma convexa a l’inici, però que després passa a tenir una forma deprimida o lleugerament amb forma d’embut, amb el marge enrollat. Presenta una cutícula seca, llisa, brillant, blanquinosa i pruïnosa.",
    gills:
        "Les làmines són molt decurrents i apretades; als primers moments són blanquinoses però després quan madura les espores es tornen rosades.",
    stalk:
        "És cilíndric, curt, massís, sovint curvat, de color blanquinós, pruinós i amb textura de feltre.",
    flesh: "És fràgil, molt terna, blanquinosa, d’oloro i de gust a farina.",
    habitat: "En els boscos d’arbres caducifòlis i de coníferes.",
    observations:
        "Clitopilus cystydiatus és una espècie molt pròxima, on la seva diferència fonamental és microscòpica, ja que al observar-se la presència de queilocistidis (cistidis al marge de les làmines) probablement molts dels exemplars determinats fins ara com a Clitopilus prunulus, correspondran realment a Clitopilus cystidiatus. És popularment coneguda com a la “delatora o acuseta”, perquè surt a la mateixa època i hàbitat que els Boletus. És un bolet comestible bo, tot i que és necessari tenir molta precaució i coneixer-la perfectament per a no confondre-la amb els clitocybes blancs tòxics. La seva olor forta a farina i les làmines roses al madurar són característiques inconfusibles d’aquest bolet.",
  ),
  Mushroom(
    name: "Rossinyol",
    scientificName: "Cantharellus cibarius",
    commonNames: "Vaqueta, Agerola",
    tags: [Tag.spring, Tag.summer, Tag.autumn, Tag.edible],
    cap:
        "Medeix entre 3 i 10 centímetres de diàmetre; al principi de forma convexa, després es torna extens i fins i tot deprimit en forma d’embut; la cutícula és llisa de color groc d’ou uniforme, amb el marge sinuós i lleument enrollat.",
    gills:
        "Esta format per plecs que són gruixuts, estan ben marcats, bifurcats decurrents, trenats e intervenats.",
    stalk:
        "És gruixut, cilíndric, llis, del mateix color que els plecs i es va aprimant cap a la base.",
    flesh:
        "És consistent, firme, elàstica, fibrosa en el peu, de color blanquinós a groguenc, amb olor afruitat, com a albercocs secs, i de gust dolç.",
    habitat:
        "Apareix en grups i colònies de nombrosos individus gregaris, en tot tipus de boscos, coníferes i caducifòlis.",
    observations:
        "S’han separat varies espècies d’aquest grup, el més important el Cantharellus pallens reconeixible per la pruïna blanca del barret i per la seva robustesa. Pot crear confusió amb altres bolets com els Hygrophoropsis aurantiaca, pròpia de pinedes, però sense conseqüències, ja que no és tòxica.És un bolet comestible excel·lent, amb una gran importància econòmica en les zones on la seva recol·lecció és abundant.",
  ),
  Mushroom(
    name: "Mataparent",
    scientificName: " Boletus satanas",
    commonNames: "Matagent",
    tags: [Tag.summer, Tag.autumn, Tag.toxic],
    cap:
        "És d’un color blanc brut. Arriba a mesurar els 30 centímetres i pot variar de forma des d’hemisfèric a pla-convex. També acostuma a tenir plecs i un marge que desborda el peu.",
    gills: "Els tubs són lliures, grocs i amb porus roigs (l’esponja).",
    stalk:
        "És curt i molt ventrut. També és radicant en la base i amb una retícula roja.",
    flesh:
        "És blanca-groguenca i blavosa al tall. L’olor es torna desagradable amb l’edat. Té un gust melós i dolç.",
    habitat: "Boscos latifolis.",
    observations:
        "Té les mateixes característiques que els Boletus rhodopurpureus, Boletus lupinus, Boletus luridus...que també són tòxics. Es pot confondre amb excel·lents comestibles, com són els Boletus aereus, Boletus pinophilus i Boletus erythropus.",
  ),
  Mushroom(
    name: "Cep",
    scientificName: "Boletus edulis",
    commonNames: "Sureny",
    tags: [Tag.summer, Tag.autumn, Tag.edible],
    cap:
        "Arriba a mesurar entre 19 i 30 centímetres. És de color beix torrat o blanc, amb cutícula brillant.",
    gills: "Té tubs i porus blancs de jove i groc-verdosos a la seva maduresa.",
    stalk:
        "Robust, massís i amb un reticulat molt marcat blanquinós sobre un fons beix-cremós; d’olor agradable i amb gust a avellana.",
    flesh:
        "És blanca i immutable, és espessa i amb gust dolç, com el de les avellanes.",
    habitat: "Boscos planifolis i de coníferes.",
    observations:
        "Molt apreciat, és el bolet de major talla i pes. És abundant i de fàcil identificació. Excel·lent per a múltiples elaboracions culinàries, tindrem en compte que els peus precisen més temps de cocció que el barret.",
  ),
  Mushroom(
    name: "Pixacà",
    scientificName: "Amanita pantherina",
    commonNames: "Pigat bord",
    tags: [Tag.autumn, Tag.toxic],
    cap:
        "El seu tamany oscil·la, segons l’edat, entre els 4 i els 10 centímetres; d’aspecte globós que oscil·larà cap a un pla convex. La cutícula és de color marró, bru i presenta berrugues semblants al cotó (restes del vel) regulars d’un color blanc pur, amb el marge clarament acanalat en els exemplars més adults.",
    gills:
        "Està format per làmines irregulars, apretades, lliures i de color blanc.",
    stalk:
        "És cilíndric, més llarg que el diàmetre del barret, de color blanc i aspecte uniforme fins la base, on acaba en un bulb. Acostuma a tenir l’anell mig-baix estripat i la volva friable (farinosa) acabada amb anells helicoïdals.",
    flesh: "És blanca, sense una olor particular.",
    habitat:
        "És habitual en els boscos planifolis frondosos amb exemplars de fulla ampla, com el faig i la roureda, tot i que també el podem trobar en les pinedes.",
    observations:
        "Ens trobem davant d’una altra amanita que hem de reconéixer sense dubtar degut a que es tracta d’un bolet altament tòxic; es pot confondre amb l’Amanita spissa i l’Amanita rubescens. Ens haurem de fixar bé en les berrugues blanques, el marge estriat i el seu particular bulb, que ens ajudaran a identificar-la.És molt tòxica: Produeix intoxicació gastrointestinal, síndrome de latència curta, i en alguns casos ha provocat la mort de qui l’ha ingerit.",
  ),
  Mushroom(
    name: 'Trompeta de la mort',
    scientificName: 'Craterellus Cornucopioides',
    commonNames: 'Rossinyol negre',
    tags: [Tag.summer, Tag.autumn, Tag.edible],
    cap:
        'De 3 a 8cm, con forma de trompeta, hueco en la base, color negro o mate, fibrilloso y con pequeñas escamas tambien oscuras, margen enrollado, ondulado irregular.',
    gills: "Està format per plecs de color gris cendra a gris blavós.",
    stalk:
        "Es cilindric i buit, una continuació del sombrero, atenuat a la base.",
    flesh:
        "Es prima, fràgil, trencadissa, de color gris fosc a negre, de olor agradable i gust dolç.",
    habitat:
        "Preferentment es troba a fagedes, tot i que es pot trobar a altres tipus de boscos.",
    observations:
        "Es una especie molt abundant, si en trobem un quants es probable que n'hi hagi molts més pels voltants. Es una seta comestible excelent. El seu aspecte negre pot fer-nos sentir respecte a l'hora de probar-la, peró es un bolet deliciòs, el millor del seu génere.",
  ),
  Mushroom(
    name: "Camagroc",
    scientificName: "Craterellus Lutescens",
    commonNames: "Rossinyolic, trompea groga",
    tags: [Tag.summer, Tag.autumn, Tag.winter, Tag.edible],
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
  Mushroom(
    name: "Pinatell",
    scientificName: "Lacttarius Deliciosus",
    commonNames: "Rovelló",
    tags: [Tag.autumn, Tag.winter, Tag.edible],
    cap:
        "D'entre 6 i 12 cm, es convex i després extens i deprimir. De color roig-ataronjat, la cutícula es aterciopelada.",
    gills:
        "Les lámines son apretades, poc decurrents i d'un color taronja amb taques verdoses.",
    stalk: "És curt, escrobiculado.",
    flesh:
        "Es banquinosa, peró pot variar una mica a color pastanaga al tallar-lo. D'una olor agradable i sabor dolç.",
    habitat: "Es troba als pinars.",
    observations:
        "Comestible. Molt comú i apreciat. Ens desfarem de tots els que segreguin latex blanc o d'un altre color.",
  )
];
