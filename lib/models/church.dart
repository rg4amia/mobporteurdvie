
class Church {
  int? value;
  String? church_v;
  int? locate;
  int? church_type;
  int? state;

  Church(
      {this.value, this.church_type, this.church_v, this.state, this.locate});

  factory Church.fromJson(Map<String, dynamic> json) {
    return Church(
        value: json['id'] as int,
        church_v: json['church_v'],
        church_type: json['church_type'],
        locate: json['locate'],
        state: json['state']);
  }
}
