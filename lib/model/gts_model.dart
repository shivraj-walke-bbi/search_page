/// page : "ENAS6458_1.0.0.0"
/// text : "ENAS6458 Authors and legal information EHRA expert consensus statement and practical guide on optimal implantation technique for conventional pacemakers and implantable cardioverter-defibrillators. Endorsed by the Heart Rhythm Society (HRS), the Asia Pacific Heart Rhythm Society (APHRS), and the Latin-American Heart Rhythm Society (LAHRS) Writing Committee: Haran Burri1 (Chair), Christoph Starck2 (Co-chair), Angelo Auricchio3, Mauro Biffi4, Mafalda Burri, MSc5, Andre D’Avila6 (LAHRS representative), Jean-Claude Deharo7, Michael Glikson8, Carsten Israel9, Chu-Pak Lau10 (APHRS representative), Christophe Leclercq11, Charles J. Love12 (HRS representative), Jens Cosedis Nielsen13, Kevin Vernooy14 Department of Cardiology, University Hospital of Geneva, Rue Gabrielle-Perret-Gentil 4, 1211 Geneva, Switzerland Department of Cardiothoracic and Vascular Surgery, German Heart Center Berlin, Augustenburger Pl. 1, 13353 Berlin, Germany and German Center of Cardiovascular Research (DZHK), partner site Berlin, Berlin, Germany and Steinbeis University Berlin, Institute (STI) of Cardiovascular Perfusion, Berlin, Germany Fondazione Cardiocentro Ticino, Via Tesserete 48, CH-6900 Lugano, Switzerland Azienda Ospedaliero-Universitaria di Bologna, Policlinico S.Orsola-Malpighi, Università di Bologna, Italy Division of Scientific Information, University of Geneva,Rue Michel Servet 1, 1211 Geneva, Switzerland Serviço de Arritmia Cardíaca - Hospital SOS Cardio,2 Florianópolis, SC, Brazil and Harvard-Thorndike Electrophysiology Institute, Beth Israel Deaconess Medical Center, Harvard Medical School, Boston, Massachusetts Hôpital de la Timone, 264 rue St Pierre - 13005 Marseille, France Shaare Zedek Medical Center, Jerusalem, Israel Dept. of Cardiology, Bethel-Clinic Bielefeld, Burgsteig 13, 33617 Bielefeld, Germany Division of Cardiology, University of Hong Kong, Queen Mary Hospital, Hong Kong Université de Rennes I, CICIT 804, Rennes, CHU Pontchaillou, Rennes, France Johns Hopkins Hospital and School of Medicine, Baltimore, MD, USA Department of Cardiology, Aarhus University Hospital, Palle Juul-Jensens Blvd. 161, 8200 Aarhus, Denmark Department of Cardiology, Cardiovascular Research Institute Maastricht (CARIM), Maastricht University Medical Center, Maastricht, The Netherlands and Department of Cardiology, Radboud University Medical Center (Radboudumc), Nijmegen, The Netherlands Reviewers Group: Nikolaos Dagres (review coordinator)1, Serge Boveda (review coordinator)2, Christian Butter3, Eloi Marijon4, Frieder Braunschweig5, Georges H. Mairesse6, Marye Gleva7, Pascal Defaye8, Francesco Zanon9, Nestor Lopez-Cabanillas10, Jose M. Guerra11, Vassilios P. Vassilikos12,13, Mario Martins Oliveira14 Department of Electrophysiology, Heart Center Leipzig at University of Leipzig, Leipzig, Germany Heart Rhythm Department, Clinique Pasteur, 31076 Toulouse, France Department of Cardiology, Heart Center Brandenburg, Chefarzt, Abteilung Kardiologie, Berlin, Germany University of Paris, Head of Cardiac Electrophysiology Section, European Georges Pompidou Hospital, 20 Rue Leblanc, 75908 Paris Cedex 15, France Karolinska University Hospital, Norrbacka S3:00, 17176 Stockholm, Sweden Department of Cardiology—Electrophysiology, Cliniques du Sud Luxembourg—Vivalia, rue des Deportes 137, BE-6700 Arlon, Belgium Washington University in St Louis, St Louis, MO, USA CHU Grenoble Alpes, Unite de Rythmologie, Service De Cardiologie, CS10135, 38043 Grenoble Cedex 09, France Arrhythmia and Electrophysiology Unit, Department of Cardiology, Santa Maria della Misericordia Hospital, Rovigo, Italy Adventist Cardiovascular Institute of Buenos Aires, Buenos Aires, Argentina Department of Cardiology, Hospital de la Santa Creu i Sant Pau, Universidad Autonoma de Barcelona, CIBERCV, Barcelona, Spain Medical School,Aristotle University of Thessaloniki, Thessaloniki, Greece 3rd Cardiology Department, Hippokrateio General Hospital, Thessaloniki, Greec Department of Cardiology, Hospital Santa Marta, Rua Santa Marta, 1167–024 Lisbon, Portugal The authors thank the EHRA Scientific Document Committee: Dr. Nikolaos Dagres, Prof. Thomas Deneke, Prof. Arthur Wilde, Prof. Frank R. Heinzel, Prof. Christian Meyer, Prof. Lucas Boersma, Prof. Radoslaw Lenarczyk, Prof. Luigi di Biase, Dr. Elena Arbelo, Dr. Avi Sabbag, Prof. Pierre Jais, Prof. Milos Taborsky, Asso. Prof. Markus Stühlinger European Society of Cardiology European Heart Rhythm Association (EHRA) 2035 Route des Colles Les Templiers - CS 80179 BIOT 06903 Sophia Antipolis Cedex - France Tel: +33 (0)4 92 94 76 00 Fax: +33 (0)4 92 94 86 46 Email: ehra@escardio.org"
/// chapterName : "Authors and legal information"
/// type : ["content"]

class GtsModel {
  GtsModel({
      String? page, 
      String? text, 
      String? chapterName, 
      List<String>? type,}){
    _page = page;
    _text = text;
    _chapterName = chapterName;
    _type = type;
}

  GtsModel.fromJson(dynamic json) {
    _page = json['page'];
    _text = json['text'];
    _chapterName = json['chapterName'];
    _type = json['type'] != null ? json['type'].cast<String>() : [];
  }
  String? _page;
  String? _text;
  String? _chapterName;
  List<String>? _type;
GtsModel copyWith({  String? page,
  String? text,
  String? chapterName,
  List<String>? type,
}) => GtsModel(  page: page ?? _page,
  text: text ?? _text,
  chapterName: chapterName ?? _chapterName,
  type: type ?? _type,
);
  String? get page => _page;
  String? get text => _text;
  String? get chapterName => _chapterName;
  List<String>? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['text'] = _text;
    map['chapterName'] = _chapterName;
    map['type'] = _type;
    return map;
  }

}