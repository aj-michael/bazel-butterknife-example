# Bazel Android Butterknife Example

This was only tested with Bazel 0.5.1. It makes the following assumptions about
your machine:

1. You have an Android SDK installed with support libraries up to date
2. You have set `$ANDROID_HOME` to point to your Android SDK
3. You have a network connection
4. You have `mvn` installed

To build the app, run

    bazel build //java/com/example/app

To run the app, run

    bazel mobile-install //java/com/example/app

If this doesn't work for you, please file a GitHub issue.

## Integrating into your own project.

You can copy `third_party/butterknife.bzl` into your own project. Make sure to
call `butterknife_repositories()` from your `WORKSPACE` and call
`butterknife_targets()` from some `BUILD` file. Then just put the `:butterknife`
target created by `butterknife_targets()` into the `deps` of an `android_binary`
or `android_library`.
