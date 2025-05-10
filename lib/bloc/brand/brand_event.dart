
abstract class BrandEvent {}
class SelectBrand extends BrandEvent {
  final String brand;
  SelectBrand(this.brand);
}
class ClearBrandFilter extends BrandEvent {}
