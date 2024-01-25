// ignore_for_file: directives_ordering
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:stacked_generator/builder.dart' as _i2;
import 'package:source_gen/builder.dart' as _i3;
import 'package:mockito/src/builder.dart' as _i4;
import 'package:build_config/build_config.dart' as _i5;
import 'package:build_web_compilers/builders.dart' as _i6;
import 'package:build_modules/builders.dart' as _i7;
import 'package:build/build.dart' as _i8;
import 'package:build_resolvers/builder.dart' as _i9;
import 'dart:isolate' as _i10;
import 'package:build_runner/build_runner.dart' as _i11;
import 'dart:io' as _i12;

final _builders = <_i1.BuilderApplication>[
  _i1.apply(
    r'stacked_generator:stackedRouterGenerator',
    [_i2.stackedRouterGenerator],
    _i1.toDependentsOf(r'stacked_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'stacked_generator:stackedLoggerGenerator',
    [_i2.stackedLoggerGenerator],
    _i1.toDependentsOf(r'stacked_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'stacked_generator:stackedLocatorGenerator',
    [_i2.stackedLocatorGenerator],
    _i1.toDependentsOf(r'stacked_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'stacked_generator:stackedFormGenerator',
    [_i2.stackedFormGenerator],
    _i1.toDependentsOf(r'stacked_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'stacked_generator:stackedDialogGenerator',
    [_i2.stackedDialogGenerator],
    _i1.toDependentsOf(r'stacked_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'stacked_generator:stackedBottomsheetGenerator',
    [_i2.stackedBottomsheetGenerator],
    _i1.toDependentsOf(r'stacked_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'source_gen:combining_builder',
    [_i3.combiningBuilder],
    _i1.toNoneByDefault(),
    hideOutput: false,
    appliesBuilders: const [r'source_gen:part_cleanup'],
  ),
  _i1.apply(
    r'mockito:mockBuilder',
    [_i4.buildMocks],
    _i1.toDependentsOf(r'mockito'),
    hideOutput: false,
    defaultGenerateFor: const _i5.InputSet(include: [r'test/**']),
  ),
  _i1.apply(
    r'build_web_compilers:sdk_js',
    [
      _i6.sdkJsCompile,
      _i6.sdkJsCopyRequirejs,
    ],
    _i1.toNoneByDefault(),
    isOptional: true,
    hideOutput: true,
  ),
  _i1.apply(
    r'build_modules:module_library',
    [_i7.moduleLibraryBuilder],
    _i1.toAllPackages(),
    isOptional: true,
    hideOutput: true,
    appliesBuilders: const [r'build_modules:module_cleanup'],
  ),
  _i1.apply(
    r'build_web_compilers:ddc_modules',
    [
      _i6.ddcMetaModuleBuilder,
      _i6.ddcMetaModuleCleanBuilder,
      _i6.ddcModuleBuilder,
    ],
    _i1.toNoneByDefault(),
    isOptional: true,
    hideOutput: true,
    appliesBuilders: const [r'build_modules:module_cleanup'],
  ),
  _i1.apply(
    r'build_web_compilers:ddc',
    [
      _i6.ddcKernelBuilder,
      _i6.ddcBuilder,
    ],
    _i1.toAllPackages(),
    isOptional: true,
    hideOutput: true,
    appliesBuilders: const [
      r'build_web_compilers:ddc_modules',
      r'build_web_compilers:dart2js_modules',
      r'build_web_compilers:dart_source_cleanup',
    ],
  ),
  _i1.apply(
    r'build_web_compilers:dart2js_modules',
    [
      _i6.dart2jsMetaModuleBuilder,
      _i6.dart2jsMetaModuleCleanBuilder,
      _i6.dart2jsModuleBuilder,
    ],
    _i1.toNoneByDefault(),
    isOptional: true,
    hideOutput: true,
    appliesBuilders: const [r'build_modules:module_cleanup'],
  ),
  _i1.apply(
    r'build_web_compilers:entrypoint',
    [_i6.webEntrypointBuilder],
    _i1.toRoot(),
    hideOutput: true,
    defaultGenerateFor: const _i5.InputSet(
      include: [
        r'web/**',
        r'test/**.dart.browser_test.dart',
        r'example/**',
        r'benchmark/**',
      ],
      exclude: [
        r'test/**.node_test.dart',
        r'test/**.vm_test.dart',
      ],
    ),
    defaultOptions: const _i8.BuilderOptions(<String, dynamic>{
      r'dart2js_args': <dynamic>[r'--minify']
    }),
    defaultDevOptions: const _i8.BuilderOptions(<String, dynamic>{
      r'dart2js_args': <dynamic>[r'--enable-asserts']
    }),
    defaultReleaseOptions:
        const _i8.BuilderOptions(<String, dynamic>{r'compiler': r'dart2js'}),
    appliesBuilders: const [r'build_web_compilers:dart2js_archive_extractor'],
  ),
  _i1.apply(
    r'build_resolvers:transitive_digests',
    [_i9.transitiveDigestsBuilder],
    _i1.toAllPackages(),
    isOptional: true,
    hideOutput: true,
    appliesBuilders: const [r'build_resolvers:transitive_digest_cleanup'],
  ),
  _i1.applyPostProcess(
    r'build_resolvers:transitive_digest_cleanup',
    _i9.transitiveDigestCleanup,
  ),
  _i1.applyPostProcess(
    r'build_modules:module_cleanup',
    _i7.moduleCleanup,
  ),
  _i1.applyPostProcess(
    r'build_web_compilers:dart2js_archive_extractor',
    _i6.dart2jsArchiveExtractor,
    defaultReleaseOptions:
        const _i8.BuilderOptions(<String, dynamic>{r'filter_outputs': true}),
  ),
  _i1.applyPostProcess(
    r'build_web_compilers:dart_source_cleanup',
    _i6.dartSourceCleanup,
    defaultReleaseOptions:
        const _i8.BuilderOptions(<String, dynamic>{r'enabled': true}),
  ),
  _i1.applyPostProcess(
    r'source_gen:part_cleanup',
    _i3.partCleanup,
  ),
];
void main(
  List<String> args, [
  _i10.SendPort? sendPort,
]) async {
  var result = await _i11.run(
    args,
    _builders,
  );
  sendPort?.send(result);
  _i12.exitCode = result;
}
