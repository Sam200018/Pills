part of 'addmedicine_bloc.dart';

class AddMedicineState {
  final bool isMedicineNameValid,
      isAmountValid,
      isAmountAbleValid,
      isActiveCompoundValid,
      isSubmitting,
      isFailure,
      isSuccess;

  AddMedicineState({
    required this.isMedicineNameValid,
    required this.isAmountValid,
    required this.isAmountAbleValid,
    required this.isActiveCompoundValid,
    required this.isSubmitting,
    required this.isFailure,
    required this.isSuccess,
  });

  bool get isFormValid => isMedicineNameValid && isAmountValid && isAmountValid;

  factory AddMedicineState.empty() {
    return AddMedicineState(
      isMedicineNameValid: true,
      isAmountValid: true,
      isAmountAbleValid: true,
      isActiveCompoundValid: true,
      isSubmitting: false,
      isFailure: false,
      isSuccess: false,
    );
  }

  factory AddMedicineState.loading() {
    return AddMedicineState(
      isMedicineNameValid: true,
      isAmountValid: true,
      isAmountAbleValid: true,
      isActiveCompoundValid: true,
      isSubmitting: true,
      isFailure: false,
      isSuccess: false,
    );
  }

  factory AddMedicineState.failure() {
    return AddMedicineState(
      isMedicineNameValid: true,
      isAmountValid: true,
      isAmountAbleValid: true,
      isActiveCompoundValid: true,
      isSubmitting: false,
      isFailure: true,
      isSuccess: false,
    );
  }

  factory AddMedicineState.success() {
    return AddMedicineState(
      isMedicineNameValid: true,
      isAmountValid: true,
      isAmountAbleValid: true,
      isActiveCompoundValid: true,
      isSubmitting: false,
      isFailure: false,
      isSuccess: true,
    );
  }

  AddMedicineState copyWith({
    bool? isMedicineNameValid,
    bool? isAmountValid,
    bool? isAmountAbleValid,
    bool? isActiveCompoundValid,
    bool? isSubmitting,
    bool? isFailure,
    bool? isSuccess,
  }) {
    return AddMedicineState(
        isMedicineNameValid: isMedicineNameValid ?? this.isMedicineNameValid,
        isAmountValid: isAmountValid ?? this.isAmountValid,
        isAmountAbleValid: isAmountAbleValid ?? this.isAmountAbleValid,
        isActiveCompoundValid:
            isActiveCompoundValid ?? this.isActiveCompoundValid,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isFailure: isFailure ?? this.isFailure,
        isSuccess: isSuccess ?? this.isSuccess);
  }

  AddMedicineState update({
    bool? isMedicineNameValid,
    bool? isAmountValid,
    bool? isAmountAbleValid,
    bool? isActiveCompoundValid,
  }) {
    return copyWith(
        isMedicineNameValid: isMedicineNameValid,
        isAmountValid: isAmountValid,
        isAmountAbleValid: isAmountAbleValid,
        isActiveCompoundValid: isActiveCompoundValid,
        isSubmitting: false,
        isFailure: false,
        isSuccess: false);
  }
}
