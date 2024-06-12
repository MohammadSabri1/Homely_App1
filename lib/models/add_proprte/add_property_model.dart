class AddPorpertyModle {
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
  List<String>? images;
  String? imageFolderName;

  AddPorpertyModle({
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
    required this.images, // added images parameter
    this.imageFolderName, // added folderName parameter
  });

  AddPorpertyModle.fromJson(Map<String, dynamic> json) {
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
    images = json['images'].cast<String>();
    imageFolderName = json['imageFolderName'];
  }

  Map<String, dynamic> toMap() {
    return {
      'cover': cover,
      'city': city,
      'treet': street,
      'price': price,
      'rom': rom,
      'pathRom': pathRom,
      'view': view,
      'pace': space,
      'floor': floor,
      'person': person,
      'detail': detail,
      'images': images,
      'imageFolderName': imageFolderName,
    };
  }
}