// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromAny)
  double get minValue => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleFromAny)
  double get maxValue => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _doubleList)
  List<double> get denominations => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringList)
  List<String> get redemptionDetails => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringList)
  List<String> get countries => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringList)
  List<String> get stores => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _stringList)
  List<String> get categories => throw _privateConstructorUsedError;
  ProductValidity? get validity => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String code,
      String name,
      String? imageUrl,
      String description,
      String currency,
      @JsonKey(fromJson: _doubleFromAny) double minValue,
      @JsonKey(fromJson: _doubleFromAny) double maxValue,
      @JsonKey(fromJson: _doubleList) List<double> denominations,
      @JsonKey(fromJson: _stringList) List<String> redemptionDetails,
      @JsonKey(fromJson: _stringList) List<String> countries,
      @JsonKey(fromJson: _stringList) List<String> stores,
      @JsonKey(fromJson: _stringList) List<String> categories,
      ProductValidity? validity});

  $ProductValidityCopyWith<$Res>? get validity;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? description = null,
    Object? currency = null,
    Object? minValue = null,
    Object? maxValue = null,
    Object? denominations = null,
    Object? redemptionDetails = null,
    Object? countries = null,
    Object? stores = null,
    Object? categories = null,
    Object? validity = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      minValue: null == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as double,
      maxValue: null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as double,
      denominations: null == denominations
          ? _value.denominations
          : denominations // ignore: cast_nullable_to_non_nullable
              as List<double>,
      redemptionDetails: null == redemptionDetails
          ? _value.redemptionDetails
          : redemptionDetails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      countries: null == countries
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<String>,
      stores: null == stores
          ? _value.stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      validity: freezed == validity
          ? _value.validity
          : validity // ignore: cast_nullable_to_non_nullable
              as ProductValidity?,
    ) as $Val);
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductValidityCopyWith<$Res>? get validity {
    if (_value.validity == null) {
      return null;
    }

    return $ProductValidityCopyWith<$Res>(_value.validity!, (value) {
      return _then(_value.copyWith(validity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      String? imageUrl,
      String description,
      String currency,
      @JsonKey(fromJson: _doubleFromAny) double minValue,
      @JsonKey(fromJson: _doubleFromAny) double maxValue,
      @JsonKey(fromJson: _doubleList) List<double> denominations,
      @JsonKey(fromJson: _stringList) List<String> redemptionDetails,
      @JsonKey(fromJson: _stringList) List<String> countries,
      @JsonKey(fromJson: _stringList) List<String> stores,
      @JsonKey(fromJson: _stringList) List<String> categories,
      ProductValidity? validity});

  @override
  $ProductValidityCopyWith<$Res>? get validity;
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? description = null,
    Object? currency = null,
    Object? minValue = null,
    Object? maxValue = null,
    Object? denominations = null,
    Object? redemptionDetails = null,
    Object? countries = null,
    Object? stores = null,
    Object? categories = null,
    Object? validity = freezed,
  }) {
    return _then(_$ProductImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      minValue: null == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as double,
      maxValue: null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as double,
      denominations: null == denominations
          ? _value._denominations
          : denominations // ignore: cast_nullable_to_non_nullable
              as List<double>,
      redemptionDetails: null == redemptionDetails
          ? _value._redemptionDetails
          : redemptionDetails // ignore: cast_nullable_to_non_nullable
              as List<String>,
      countries: null == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<String>,
      stores: null == stores
          ? _value._stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      validity: freezed == validity
          ? _value.validity
          : validity // ignore: cast_nullable_to_non_nullable
              as ProductValidity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl extends _Product {
  const _$ProductImpl(
      {this.code = '',
      this.name = '',
      this.imageUrl,
      this.description = '',
      this.currency = '',
      @JsonKey(fromJson: _doubleFromAny) this.minValue = 0.0,
      @JsonKey(fromJson: _doubleFromAny) this.maxValue = 0.0,
      @JsonKey(fromJson: _doubleList)
      final List<double> denominations = const <double>[],
      @JsonKey(fromJson: _stringList)
      final List<String> redemptionDetails = const <String>[],
      @JsonKey(fromJson: _stringList)
      final List<String> countries = const <String>[],
      @JsonKey(fromJson: _stringList)
      final List<String> stores = const <String>[],
      @JsonKey(fromJson: _stringList)
      final List<String> categories = const <String>[],
      this.validity})
      : _denominations = denominations,
        _redemptionDetails = redemptionDetails,
        _countries = countries,
        _stores = stores,
        _categories = categories,
        super._();

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String name;
  @override
  final String? imageUrl;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  final double minValue;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  final double maxValue;
  final List<double> _denominations;
  @override
  @JsonKey(fromJson: _doubleList)
  List<double> get denominations {
    if (_denominations is EqualUnmodifiableListView) return _denominations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_denominations);
  }

  final List<String> _redemptionDetails;
  @override
  @JsonKey(fromJson: _stringList)
  List<String> get redemptionDetails {
    if (_redemptionDetails is EqualUnmodifiableListView)
      return _redemptionDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_redemptionDetails);
  }

  final List<String> _countries;
  @override
  @JsonKey(fromJson: _stringList)
  List<String> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  final List<String> _stores;
  @override
  @JsonKey(fromJson: _stringList)
  List<String> get stores {
    if (_stores is EqualUnmodifiableListView) return _stores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stores);
  }

  final List<String> _categories;
  @override
  @JsonKey(fromJson: _stringList)
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final ProductValidity? validity;

  @override
  String toString() {
    return 'Product(code: $code, name: $name, imageUrl: $imageUrl, description: $description, currency: $currency, minValue: $minValue, maxValue: $maxValue, denominations: $denominations, redemptionDetails: $redemptionDetails, countries: $countries, stores: $stores, categories: $categories, validity: $validity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.minValue, minValue) ||
                other.minValue == minValue) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue) &&
            const DeepCollectionEquality()
                .equals(other._denominations, _denominations) &&
            const DeepCollectionEquality()
                .equals(other._redemptionDetails, _redemptionDetails) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            const DeepCollectionEquality().equals(other._stores, _stores) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.validity, validity) ||
                other.validity == validity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      name,
      imageUrl,
      description,
      currency,
      minValue,
      maxValue,
      const DeepCollectionEquality().hash(_denominations),
      const DeepCollectionEquality().hash(_redemptionDetails),
      const DeepCollectionEquality().hash(_countries),
      const DeepCollectionEquality().hash(_stores),
      const DeepCollectionEquality().hash(_categories),
      validity);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product extends Product {
  const factory _Product(
      {final String code,
      final String name,
      final String? imageUrl,
      final String description,
      final String currency,
      @JsonKey(fromJson: _doubleFromAny) final double minValue,
      @JsonKey(fromJson: _doubleFromAny) final double maxValue,
      @JsonKey(fromJson: _doubleList) final List<double> denominations,
      @JsonKey(fromJson: _stringList) final List<String> redemptionDetails,
      @JsonKey(fromJson: _stringList) final List<String> countries,
      @JsonKey(fromJson: _stringList) final List<String> stores,
      @JsonKey(fromJson: _stringList) final List<String> categories,
      final ProductValidity? validity}) = _$ProductImpl;
  const _Product._() : super._();

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String? get imageUrl;
  @override
  String get description;
  @override
  String get currency;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  double get minValue;
  @override
  @JsonKey(fromJson: _doubleFromAny)
  double get maxValue;
  @override
  @JsonKey(fromJson: _doubleList)
  List<double> get denominations;
  @override
  @JsonKey(fromJson: _stringList)
  List<String> get redemptionDetails;
  @override
  @JsonKey(fromJson: _stringList)
  List<String> get countries;
  @override
  @JsonKey(fromJson: _stringList)
  List<String> get stores;
  @override
  @JsonKey(fromJson: _stringList)
  List<String> get categories;
  @override
  ProductValidity? get validity;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
