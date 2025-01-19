import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apiproject/savepost/logic/save_state.dart';

import '../../../core/helpers/constants.dart';

import '../../core/helpers/sharedpreference.dart';
import '../repo.dart';

class SaveCubit extends Cubit<SaveState> {
  final SaveRepo _saveRepo;
  SaveCubit(this._saveRepo) : super(const SaveState.initial());

  void getSpecializations() async {
    emit(const SaveState.specializationsLoading());
    final response = await _saveRepo.getSpecialization();
    response.when(
      success: (specializationsResponseModel) async {
        print(' truuuuuuuuuuuuuu');
        emit(SaveState.specializationsSuccess(specializationsResponseModel));
      },
      failure: (errorHandler) {
        print(' falseeeeeeeeeeeeeeeeeeeeee');
        print(' falseeeeeeeeeeeeeeeeeeeeee ${errorHandler}');
        emit(SaveState.specializationsError(errorHandler));
      },
    );
  }

  Future savePostId(int postId) async {
    await SharedPrefHelper.setData(SharedPrefKeys.postId, postId);
  }
}
