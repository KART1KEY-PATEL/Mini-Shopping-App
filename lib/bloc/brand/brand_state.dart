

abstract class BrandState {}
class BrandInitial extends BrandState {}
class BrandSelected extends BrandState {
  final String selectedBrand;
  BrandSelected(this.selectedBrand);
}