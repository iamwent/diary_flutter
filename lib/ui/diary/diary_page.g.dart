// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$diaryStreamHash() => r'6d862219b8adf6184a488ac32443b80f9f7af38d';

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

/// See also [diaryStream].
@ProviderFor(diaryStream)
const diaryStreamProvider = DiaryStreamFamily();

/// See also [diaryStream].
class DiaryStreamFamily extends Family<AsyncValue<Diary?>> {
  /// See also [diaryStream].
  const DiaryStreamFamily();

  /// See also [diaryStream].
  DiaryStreamProvider call(
    int id,
  ) {
    return DiaryStreamProvider(
      id,
    );
  }

  @override
  DiaryStreamProvider getProviderOverride(
    covariant DiaryStreamProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'diaryStreamProvider';
}

/// See also [diaryStream].
class DiaryStreamProvider extends AutoDisposeStreamProvider<Diary?> {
  /// See also [diaryStream].
  DiaryStreamProvider(
    int id,
  ) : this._internal(
          (ref) => diaryStream(
            ref as DiaryStreamRef,
            id,
          ),
          from: diaryStreamProvider,
          name: r'diaryStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$diaryStreamHash,
          dependencies: DiaryStreamFamily._dependencies,
          allTransitiveDependencies:
              DiaryStreamFamily._allTransitiveDependencies,
          id: id,
        );

  DiaryStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    Stream<Diary?> Function(DiaryStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DiaryStreamProvider._internal(
        (ref) => create(ref as DiaryStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Diary?> createElement() {
    return _DiaryStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DiaryStreamProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DiaryStreamRef on AutoDisposeStreamProviderRef<Diary?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DiaryStreamProviderElement
    extends AutoDisposeStreamProviderElement<Diary?> with DiaryStreamRef {
  _DiaryStreamProviderElement(super.provider);

  @override
  int get id => (origin as DiaryStreamProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
