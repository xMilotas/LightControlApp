class Light {
  final String localizedTitle;
  final String subTitle;
  final int id;

  Light(this.id, this.localizedTitle, this.subTitle);
}

final List<Light> lights = [
  Light(1, "Wohnzimmer", "Stehlampe"),
  Light(2, "Wohnzimmer", "Kugellampe"),
  Light(3, "Schlafzimmer", ' '),
  Light(4, "Wohnzimmer", "PC"),
  Light(6, "Alle Lichter", ' '),
];
