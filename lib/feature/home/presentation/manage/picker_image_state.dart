part of 'picker_image_cubit.dart';

@immutable
sealed class PickerImageState {}

final class PickerImageInitial extends PickerImageState {}
final class PickerImageLoading extends PickerImageState {}
final class PickerImageSuccess extends PickerImageState {
  final File imageFile;
  PickerImageSuccess({required this.imageFile});
}
final class PickerImageFailure extends PickerImageState {}
final class PickerImageCovertImageToLinkSuccess extends PickerImageState {
  final String imageLink;

  PickerImageCovertImageToLinkSuccess(this.imageLink);
}
final class PickerImageCovertImageToLinkFailure extends PickerImageState {
  final String message;

  PickerImageCovertImageToLinkFailure(this.message);
}
