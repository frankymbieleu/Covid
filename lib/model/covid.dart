import 'country.dart';
import 'global.dart';

class Covid {
  Global global;
  List<Countries> countries;

  Covid({this.global, this.countries});

  Covid.fromJson(Map<String, dynamic> json) {
    global =
    json['Global'] != null ? new Global.fromJson(json['Global']) : null;
    if (json['Countries'] != null) {
      countries = new List<Countries>();
      json['Countries'].forEach((v) {
        countries.add(new Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.global != null) {
      data['Global'] = this.global.toJson();
    }
    if (this.countries != null) {
      data['Countries'] = this.countries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
