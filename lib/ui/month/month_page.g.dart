// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$monthsHash() => r'ad38325867e91b2a2e476cf540945552e6586685';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [months].
@ProviderFor(months)
const monthsProvider = MonthsFamily();

/// See also [months].
class MonthsFamily extends Family<AsyncValue<List<Month>>> {
  /// See also [months].
  const MonthsFamily();

  /// See also [months].
  MonthsProvider call(
    Year year,
  ) {
    return MonthsProvider(
      year,
    );
  }

  @override
  MonthsProvider getProviderOverride(
    covariant MonthsProvider provider,
  ) {
    return call(
      provider.year,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'monthsProvider';
}

/// See also [months].
class MonthsProvider extends AutoDisposeFutureProvider<List<Month>> {
  /// See also [months].
  MonthsProvider(
    Year year,
  ) : this._internal(
          (ref) => months(
            ref as MonthsRef,
            year,
          ),
          from: monthsProvider,
          name: r'monthsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$monthsHash,
          dependencies: MonthsFamily._dependencies,
          allTransitiveDependencies: MonthsFamily._allTransitiveDependencies,
          year: year,
        );

  MonthsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.year,
  }) : super.internal();

  final Year year;

  @override
  Override overrideWith(
    FutureOr<List<Month>> Function(MonthsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MonthsProvider._internal(
        (ref) => create(ref as MonthsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        year: year,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Month>> createElement() {
    return _MonthsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MonthsProvider && other.year == year;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MonthsRef on AutoDisposeFutureProviderRef<List<Month>> {
  /// The parameter `year` of this provider.
  Year get year;
}

class _MonthsProviderElement
    extends AutoDisposeFutureProviderElement<List<Month>> with MonthsRef {
  _MonthsProviderElement(super.provider);

  @override
  Year get year => (origin as MonthsProvider).year;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
