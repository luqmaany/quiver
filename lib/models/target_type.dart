enum TargetType {
  wa10Ring122cm('WA 10-Ring 122cm'),
  wa10Ring80cm('WA 10-Ring 80cm'),
  wa10Ring40cm('WA 10-Ring 40cm'),
  wa6Ring80cm('WA 6-Ring 80cm'),
  waTripleSpot('WA Triple Spot'),
  vegas3Spot('Vegas 3-Spot'),
  nfaaField('NFAA Field'),
  nfaaIndoor5Spot('NFAA Indoor 5-Spot');

  const TargetType(this.displayName);
  final String displayName;

  String get id => name;

  static TargetType fromId(String id) {
    return TargetType.values.firstWhere((type) => type.name == id);
  }
}
