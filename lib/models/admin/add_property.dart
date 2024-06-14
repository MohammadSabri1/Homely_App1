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
  List<String>? images;

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
    required this.images,
  });

  factory adminAddPorpertyModle.fromMap(Map<String, dynamic> map) {
    return adminAddPorpertyModle(
      cover: map['cover'],
      city: map['city'],
      street: map['street'],
      price: map['price'],
      rom: map['rom'],
      pathRom: map['pathRom'],
      view: map['view'],
      space: map['space'],
      floor: map['floor'],
      person: map['person'],
      detail: map['detail'],
      type: map['type'],
      date: map['date'],
      imageFolderName: map['imageFolderName'],
        images: List<String>.from(map['images'])
    );
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
      'images': images,
      'type': type,
      'date': date,
      'imageFolderName': imageFolderName,
    };
  }
}