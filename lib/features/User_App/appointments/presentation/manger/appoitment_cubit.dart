
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/features/User_App/appointments/presentation/manger/appoitment_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingState(canEdit: false, canceledListTile: false,availableToWork: false));


    canEditListTile()  {
    emit(state.copyWith(canEdit: true));
    }

    canceledListTile()  {
    emit(state.copyWith(canceledListTile: true));
    }









}
