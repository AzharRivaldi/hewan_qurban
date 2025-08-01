class ModelDatabase {
  int? id;
  String? nama;
  String? size;
  String? jml_uang;
  String? tgl_order;
  String? image_url;

  ModelDatabase({this.id, this.nama, this.size,
    this.jml_uang, this.tgl_order, this.image_url});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'size': size,
      'jml_uang': jml_uang,
      'tgl_order': tgl_order,
      'image_url': image_url,
    };
  }

  factory ModelDatabase.fromMap(Map<String, dynamic> map) {
    return ModelDatabase(
      id: map['id'],
      nama: map['nama'],
      size: map['size'],
      jml_uang: map['jml_uang'],
      tgl_order: map['tgl_order'],
      image_url: map['image_url'],
    );
  }
}