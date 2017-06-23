load("@bazel_tools//tools/build_defs/repo:maven_rules.bzl", "maven_aar", "maven_jar")

def butterknife_repositories():
  maven_aar(
      name = "butterknife",
      artifact = "com.jakewharton:butterknife:8.6.0",
  )

  maven_jar(
      name = "butterknife_annotations",
      artifact = "com.jakewharton:butterknife-annotations:8.6.0",
  )

  maven_jar(
      name = "butterknife_compiler",
      artifact = "com.jakewharton:butterknife-compiler:8.6.0",
  )

  maven_jar(
      name = "auto_common",
      artifact = "com.google.auto:auto-common:0.6",
  )

  maven_jar(
      name = "guava",
      artifact = "com.google.guava:guava:18.0",
  )

  maven_jar(
      name = "javapoet",
      artifact = "com.squareup:javapoet:1.8.0",
  )

def butterknife_targets():
  native.android_library(
      name = "butterknife_runtime",
      exports = [
          "@butterknife//aar",
          "@butterknife_annotations//jar",
          "@androidsdk//com.android.support:support-annotations-25.1.0",
          "@androidsdk//com.android.support:support-compat-25.1.0",
      ],
      visibility = ["//visibility:public"],
  )

  native.java_plugin(
      name = "butterknife_compiler",
      processor_class = "butterknife.compiler.ButterKnifeProcessor",
      deps = [
          "@butterknife_compiler//jar",
          "@javapoet//jar",
          "@butterknife_annotations//jar",
          "@auto_common//jar",
          "@guava//jar",
      ],
      visibility = ["//visibility:private"],
  )

  native.java_library(
      name = "butterknife_processor",
      exported_plugins = [
          ":butterknife_compiler",
      ],
      visibility = ["//visibility:public"],
  )
