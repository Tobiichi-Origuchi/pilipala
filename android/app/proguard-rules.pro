# ==================== Don't warn ====================
-dontwarn javax.annotation.**
-dontwarn javax.annotation.Nullable
-dontwarn org.conscrypt.**
-dontwarn org.bouncycastle.**
-dontwarn org.openjsse.**
-dontwarn com.google.android.play.core.splitcompat.**
-dontwarn com.google.android.play.core.splitinstall.**
-dontwarn com.google.android.play.core.tasks.**

# ==================== Keep for Flutter & Plugins ====================
-keep class com.origuchi.pilipala.MainActivity { *; }

# Flutter 核心
-keep class io.flutter.embedding.engine.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.embedding.android.** { *; }
-keep class io.flutter.plugin.platform.** { *; }

# 插件
-keep class com.ryanheise.audioservice.** { *; }
-keep class dev.fluttercommunity.plus.packageinfo.** { *; }
-keep class com.geetest.gt3flutterplugin.** { *; }

# media_kit
-keep class com.media_kit.** { *; }

# 额外安全
-keep class com.hivedb.** { *; }

# ==================== Keep attributes ====================
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes SourceFile,LineNumberTable
-keepattributes InnerClasses
