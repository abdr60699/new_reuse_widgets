# Android Build Fix Guide

If you're getting the error "Must provide Flutter source directory", follow these steps:

## Quick Fix (Recommended)

Run this command in your project root directory:

```bash
flutter pub get
```

This will automatically generate the `android/local.properties` file with the correct Flutter SDK path.

## Manual Fix (If Quick Fix Doesn't Work)

### Step 1: Find Your Flutter SDK Path

Run this command:
```bash
flutter --version -v
```

Look for a line like:
```
Flutter • channel stable • https://github.com/flutter/flutter.git
Flutter SDK at /Users/username/flutter
```

The path after "Flutter SDK at" is your Flutter SDK path.

### Step 2: Create local.properties File

Create a file at `android/local.properties` with the following content:

**On Windows:**
```properties
flutter.sdk=C:\\Users\\YourUsername\\flutter
sdk.dir=C:\\Users\\YourUsername\\AppData\\Local\\Android\\sdk
```

**On Mac/Linux:**
```properties
flutter.sdk=/Users/YourUsername/flutter
sdk.dir=/Users/YourUsername/Library/Android/sdk
```

Replace the paths with your actual Flutter SDK and Android SDK locations.

### Step 3: Find Your Android SDK Path

**On Windows:**
- Usually: `C:\Users\YourUsername\AppData\Local\Android\sdk`

**On Mac:**
- Usually: `/Users/YourUsername/Library/Android/sdk`

**On Linux:**
- Usually: `/home/YourUsername/Android/Sdk`

## Alternative: Set Environment Variable

Instead of creating local.properties, you can set the `FLUTTER_ROOT` environment variable:

**Windows (PowerShell):**
```powershell
$env:FLUTTER_ROOT="C:\Users\YourUsername\flutter"
```

**Mac/Linux (bash/zsh):**
```bash
export FLUTTER_ROOT="/Users/YourUsername/flutter"
```

## After Applying the Fix

1. Clean the project: `flutter clean`
2. Get dependencies: `flutter pub get`
3. Try running again: `flutter run`

## Still Having Issues?

Make sure:
- Flutter is properly installed: `flutter doctor`
- Android SDK is properly installed
- You're in the correct project directory when running commands
