// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$diariesStreamHash() => r'43955c20910958070a7ab7cad8acc28923ec0930';

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

/// See also [diariesStream].
@ProviderFor(diariesStream)
const diariesStreamProvider = DiariesStreamFamily();

/// See also [diariesStream].
class DiariesStreamFamily extends Family<AsyncValue<List<Diary>>> {
  /// See also [diariesStream].
  const DiariesStreamFamily();

  /// See also [diariesStream].
  DiariesStreamProvider call(
    Year year,
    Month month,
  ) {
    return DiariesStreamProvider(
      year,
      month,
    );
  }

  @override
  DiariesStreamProvider getProviderOverride(
    covariant DiariesStreamProvider provider,
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
  String? get name => r'diariesStreamProvider';
}

/// See also [diariesStream].
class DiariesStreamProvider extends AutoDisposeStreamProvider<List<Diary>> {
  /// See also [diariesStream].
  DiariesStreamProvider(
    Year year,
    Month month,
  ) : this._internal(
          (ref) => diariesStream(
            ref as DiariesStreamRef,
            year,
            month,
          ),
          from: diariesStreamProvider,
          name: r'diariesStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$diariesStreamHash,
          dependencies: DiariesStreamFamily._dependencies,
          allTransitiveDependencies:
              DiariesStreamFamily._allTransitiveDependencies,
          year: year,
          month: month,
        );

  DiariesStreamProvider._internal(
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
    Stream<List<Diary>> Function(DiariesStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DiariesStreamProvider._internal(
        (ref) => create(ref as DiariesStreamRef),
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
  AutoDisposeStreamProviderElement<List<Diary>> createElement() {
    return _DiariesStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DiariesStreamProvider &&
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

mixin DiariesStreamRef on AutoDisposeStreamProviderRef<List<Diary>> {
  /// The parameter `year` of this provider.
  Year get year;

  /// The parameter `month` of this provider.
  Month get month;
}

class _DiariesStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<Diary>>
    with DiariesStreamRef {
  _DiariesStreamProviderElement(super.provider);

  @override
  Year get year => (origin as DiariesStreamProvider).year;
  @override
  Month get month => (origin as DiariesStreamProvider).month;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
