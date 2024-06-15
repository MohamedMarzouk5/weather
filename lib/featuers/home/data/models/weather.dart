class Weather {
  final String name;
  final num temp;
  final num maxTemp;
  final num miniTemp;
  final String description;
  final String icon;
  Weather({
    required this.name,
    required this.temp,
    required this.maxTemp,
    required this.miniTemp,
    required this.description,
    required this.icon,
  });

  Weather copyWith({
    String? name,
    double? temp,
    double? maxTemp,
    double? miniTemp,
    String? description,
    String? icon,
  }) {
    return Weather(
      name: name ?? this.name,
      temp: temp ?? this.temp,
      maxTemp: maxTemp ?? this.maxTemp,
      miniTemp: miniTemp ?? this.miniTemp,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  factory Weather.fromMap(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];

    return Weather(
      description: weather['description'],
      icon: weather['icon'],
      temp: main['temp'],
      miniTemp: main['temp_min'],
      maxTemp: main['temp_max'],
      name: json['name'],
    );
  }

  @override
  String toString() {
    return 'Weather(name: $name, temp: $temp, maxTemp: $maxTemp, miniTemp: $miniTemp, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.temp == temp &&
        other.maxTemp == maxTemp &&
        other.miniTemp == miniTemp &&
        other.description == description &&
        other.icon == icon;
  }

  factory Weather.initial() => Weather(
        temp: 100,
        name: '',
        description: '',
        icon: '',
        maxTemp: 100,
        miniTemp: 100,
      );
  @override
  int get hashCode {
    return name.hashCode ^
        temp.hashCode ^
        maxTemp.hashCode ^
        miniTemp.hashCode ^
        description.hashCode ^
        icon.hashCode;
  }
}
