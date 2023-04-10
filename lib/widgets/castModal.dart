class Cast {
  final String? name;
  final String? profileImage;
  const Cast({required this.name, required this.profileImage});
  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
        name: json['original_name'], profileImage: json['profile_path']);
  }
}
