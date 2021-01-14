package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
      com.github.contactlutforrahman.flutter_qr_bar_scanner.FlutterQrBarScannerPlugin.registerWith(shimPluginRegistry.registrarFor("com.github.contactlutforrahman.flutter_qr_bar_scanner.FlutterQrBarScannerPlugin"));
      com.github.rmtmckenzie.nativedeviceorientation.NativeDeviceOrientationPlugin.registerWith(shimPluginRegistry.registrarFor("com.github.rmtmckenzie.nativedeviceorientation.NativeDeviceOrientationPlugin"));
    flutterEngine.getPlugins().add(new io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin());
  }
}
