class adminAddPorpertyModle {
  String? floor;
  String? space;
  String? view;
  String? pathRom;
  String? rom;
  String? price;
  String? city;
  String? cover;
  String? street;
  String? detail;
  String? person;
  String? type;
  String? date;
  String? imageFolderName;
  List<String>? images; // added images field

  adminAddPorpertyModle({
    this.floor,
    this.space,
    this.view,
    this.pathRom,
    this.rom,
    this.street,
    this.city,
    this.cover,
    this.detail,
    this.person,
    this.price,
    this.type,
    this.date,
    this.imageFolderName,
    required this.images, // added images parameter
  });

  adminAddPorpertyModle.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    city = json['city'];
    street = json['street'];
    price = json['price'];
    rom = json['rom'];
    pathRom = json['pathRom'];
    view = json['view'];
    space = json['space'];
    floor = json['floor'];
    person = json['person'];
    detail = json['detail'];
    type = json['type'];
    date = json['date'];
    imageFolderName = json['imageFolderName'];
    images = json['images'].cast<String>(); // added images field
  }

  Map<String, dynamic> toMap() {
    return {
      'cover': cover,
      'city': city,
      'street': street,
      'price': price,
      'rom': rom,
      'pathRom': pathRom,
      'view': view,
      'space': space,
      'floor': floor,
      'person': person,
      'detail': detail,
      'images': images, // added images field
      'type': type,
      'date': date,
      'imageFolderName': imageFolderName,
    };
  }
}