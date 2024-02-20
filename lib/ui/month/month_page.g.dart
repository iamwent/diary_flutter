// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$monthsStreamHash() => r'3bdbecae530846c988674660c319a7bb60d59415';

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

/// See also [monthsStream].
@ProviderFor(monthsStream)
const monthsStreamProvider = MonthsStreamFamily();

/// See also [monthsStream].
class MonthsStreamFamily extends Family<AsyncValue<List<Month>>> {
  /// See also [monthsStream].
  const MonthsStreamFamily();

  /// See also [monthsStream].
  MonthsStreamProvider call(
    Year year,
  ) {
    return MonthsStreamProvider(
      year,
    );
  }

  @override
  MonthsStreamProvider getProviderOverride(
    covariant MonthsStreamProvider provider,
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
  String? get name => r'monthsStreamProvider';
}

/// See also [monthsStream].
class MonthsStreamProvider extends AutoDisposeStreamProvider<List<Month>> {
  /// See also [monthsStream].
  MonthsStreamProvider(
    Year year,
  ) : this._internal(
          (ref) => monthsStream(
            ref as MonthsStreamRef,
            year,
          ),
          from: monthsStreamProvider,
          name: r'monthsStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$monthsStreamHash,
          dependencies: MonthsStreamFamily._dependencies,
          allTransitiveDependencies:
              MonthsStreamFamily._allTransitiveDependencies,
          year: year,
        );

  MonthsStreamProvider._internal(
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
    Stream<List<Month>> Function(MonthsStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MonthsStreamProvider._internal(
        (ref) => create(ref as MonthsStreamRef),
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
  AutoDisposeStreamProviderElement<List<Month>> createElement() {
    return _MonthsStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MonthsStreamProvider && other.year == year;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MonthsStreamRef on AutoDisposeStreamProviderRef<List<Month>> {
  /// The parameter `year` of this provider.
  Year get year;
}

class _MonthsStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<Month>> with MonthsStreamRef {
  _MonthsStreamProviderElement(super.provider);

  @override
  Year get year => (origin as MonthsStreamProvider).year;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
