// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$diariesHash() => r'5d925035367dddd2396d1b44766016a9b13b348d';

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

/// See also [diaries].
@ProviderFor(diaries)
const diariesProvider = DiariesFamily();

/// See also [diaries].
class DiariesFamily extends Family<AsyncValue<List<Diary>>> {
  /// See also [diaries].
  const DiariesFamily();

  /// See also [diaries].
  DiariesProvider call(
    Year year,
    Month month,
  ) {
    return DiariesProvider(
      year,
      month,
    );
  }

  @override
  DiariesProvider getProviderOverride(
    covariant DiariesProvider provider,
  ) {
    return call(
      provider.year,
      provider.month,
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
  String? get name => r'diariesProvider';
}

/// See also [diaries].
class DiariesProvider extends AutoDisposeFutureProvider<List<Diary>> {
  /// See also [diaries].
  DiariesProvider(
    Year year,
    Month month,
  ) : this._internal(
          (ref) => diaries(
            ref as DiariesRef,
            year,
            month,
          ),
          from: diariesProvider,
          name: r'diariesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$diariesHash,
          dependencies: DiariesFamily._dependencies,
          allTransitiveDependencies: DiariesFamily._allTransitiveDependencies,
          year: year,
          month: month,
        );

  DiariesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.year,
    required this.month,
  }) : super.internal();

  final Year year;
  final Month month;

  @override
  Override overrideWith(
    FutureOr<List<Diary>> Function(DiariesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DiariesProvider._internal(
        (ref) => create(ref as DiariesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        year: year,
        month: month,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Diary>> createElement() {
    return _DiariesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DiariesProvider &&
        other.year == year &&
        other.month == month;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DiariesRef on AutoDisposeFutureProviderRef<List<Diary>> {
  /// The parameter `year` of this provider.
  Year get year;

  /// The parameter `month` of this provider.
  Month get month;
}

class _DiariesProviderElement
    extends AutoDisposeFutureProviderElement<List<Diary>> with DiariesRef {
  _DiariesProviderElement(super.provider);

  @override
  Year get year => (origin as DiariesProvider).year;
  @override
  Month get month => (origin as DiariesProvider).month;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
