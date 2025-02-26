class RatingState {
  final bool? availableToWork;

  RatingState({this.availableToWork = false});

  RatingState copyWith({
    bool? availableToWork,
  }) {
    return RatingState(
      availableToWork: availableToWork ?? availableToWork,
    );
  }
}
