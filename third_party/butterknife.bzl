load("@bazel_tools//tools/build_defs/repo:maven_rules.bzl", "maven_aar", "maven_jar")

def butterknife_repositories():
  maven_aar(
      name = "butterknife",
      artifact = "com.jakewharton:butterknife:8.6.0",
      sha1 = "1b815499758976b806309a1ac305b38e3a1b1470",
  )

  maven_jar(
      name = "butterknife_annotations",
      artifact = "com.jakewharton:butterknife-annotations:8.6.0",
      sha1 = "48efa6f14074e1a6b16e02ac05eba3fc5c7c7ec8",
  )

  maven_jar(
      name = "butterknife_compiler",
      artifact = "com.jakewharton:butterknife-compiler:8.6.0",
      sha1 = "d3defb48a63aa0591117d0cec09f47a13fffda19",
  )

  maven_jar(
      name = "auto_common",
      artifact = "com.google.auto:auto-common:0.6",
      sha1 = "cf7212b0f8bfef12657b942df8f4f2cf032d3f41",
  )

  maven_jar(
      name = "guava",
      artifact = "com.google.guava:guava:18.0",
      sha1 = "cce0823396aa693798f8882e64213b1772032b09",
  )

  maven_jar(
      name = "javapoet",
      artifact = "com.squareup:javapoet:1.8.0",
      sha1 = "e858dc62ef484048540d27d36f3ec2177a3fa9b1",
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
