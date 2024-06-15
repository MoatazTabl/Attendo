part of 'qr_cubit.dart';

@immutable
sealed class QrState {}

final class QrInitial extends QrState {}

final class QrSuccess extends QrState {
  final String successMessage;

  QrSuccess(this.successMessage);
}

final class QrError extends QrState {
  final String errorMessage;

  QrError(this.errorMessage);
}
