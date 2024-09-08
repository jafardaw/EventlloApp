abstract class SpecialRequirementState {}

class SpecialRequirementInitial extends SpecialRequirementState {}

class SpecialRequirementLoading extends SpecialRequirementState {}

class SpecialRequirementLoaded extends SpecialRequirementState {
  final String masseg;
  SpecialRequirementLoaded({required this.masseg});
}

class SpecialRequirementError extends SpecialRequirementState {
  final String errorMessage;

  SpecialRequirementError(this.errorMessage);
}
