// bloc/brand/brand_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shopping_app/bloc/brand/brand_event.dart';
import 'package:mini_shopping_app/bloc/brand/brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  BrandBloc() : super(BrandInitial()) {
    on<SelectBrand>(_onSelectBrand);
    on<ClearBrandFilter>(_onClearFilter);
  }

  void _onSelectBrand(SelectBrand event, Emitter<BrandState> emit) {
    emit(BrandSelected(event.brand));
  }

  void _onClearFilter(ClearBrandFilter event, Emitter<BrandState> emit) {
    emit(BrandInitial());
  }
}
