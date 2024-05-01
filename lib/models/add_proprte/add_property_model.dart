class AddPorpertyModle {
  // String? image;
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
  });
  AddPorpertyModle.formJson(Map<String,dynamic>josn){
    cover=josn['cover'];
    city=josn['city'];
    street=josn['street'];
    price=josn['price'];
    rom=josn['rom'];
    pathRom=josn['pathRom'];
    view=josn['view'];
    space=josn['space'];
    floor=josn['floor'];
    person=josn['person'];
    detail=josn['detail'];

  }
  Map<String,dynamic>toMap()
  {
    return {
      'cover':cover,
      'city':city,
      'street':street,
      'price':price,
      'rom':rom,
      'pathRom':pathRom,
      'view':view,
      'space':space,
      'floor':floor,
      'person':person,
      'detail':detail,
    };
  }

}