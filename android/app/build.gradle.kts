import java.io.FileInputStream
import java.util.Properties
import com.android.build.gradle.api.ApkVariantOutput

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystorePropertiesFile = rootProject.file("key.properties")
val keystoreProperties = Properties()
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

val storeFileEnv = System.getenv("KEYSTORE") ?: keystoreProperties.getProperty("storeFile") ?: "vvex.jks"
val storePasswordEnv = System.getenv("KEYSTORE_PASSWORD") ?: keystoreProperties.getProperty("storePassword")
val keyAliasEnv = System.getenv("KEY_ALIAS") ?: keystoreProperties.getProperty("keyAlias")
val keyPasswordEnv = System.getenv("KEY_PASSWORD") ?: keystoreProperties.getProperty("keyPassword")

android {
    namespace = "com.origuchi.pilipala"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.origuchi.pilipala"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }

    signingConfigs {
        create("release") {
            storeFile = file(storeFileEnv)
            storePassword = storePasswordEnv
            keyAlias = keyAliasEnv
            keyPassword = keyPasswordEnv
            enableV1Signing = true
            enableV2Signing = true
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            setProguardFiles(
                listOf(
                    getDefaultProguardFile("proguard-android-optimize.txt"),
                    file("proguard-rules.pro")
                )
            )
        }
    }
}

flutter {
    source = "../.."
}

val abiCodes = mapOf("x86_64" to 1, "armeabi-v7a" to 2, "arm64-v8a" to 3)

android.applicationVariants.all {
    val variantVersionCode = this.versionCode
    outputs.all {
        val output = this as ApkVariantOutput
        val filter = output.filters.find { it.filterType == "ABI" }
        val abiVersionCode = abiCodes[filter?.identifier]

        if (abiVersionCode != null) {
            versionCodeOverride = variantVersionCode * 10 + abiVersionCode
        }
    }
}
