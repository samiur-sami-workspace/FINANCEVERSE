# FINANCEVERSE Mobile & Desktop Builds

This branch adds native application packaging around the existing FINANCEVERSE web app. The production website and its existing Supabase backend are not changed by these packaging files.

## Shared architecture

- Web: existing `index.html` and `config.js`
- Android: Capacitor 8, generated from the same web source
- Windows: Electron desktop shell
- Authentication and cloud saves: existing Supabase project and existing application logic

The mobile preparation script copies the current root `index.html` and `config.js` into `www/` immediately before Capacitor sync. Do not edit the generated `www/` copy directly.

## Requirements

- Node.js 22 or newer and npm
- Android builds: Android Studio, Android SDK, and a compatible JDK (use the JDK version required by the generated Android Gradle project)
- Windows installer: build on Windows for the Windows NSIS installer

## Android APK

```bash
npm install
npm run android:init
npm run android:sync
npm run android:open
```

In Android Studio, select a device or emulator and run the app. To build a debug APK from a Windows terminal after Android is initialized:

```bash
npm run android:debug
```

The debug APK is generated under `android/app/build/outputs/apk/debug/`.

For a distributable release, configure an Android signing key securely in the local build environment and generate a signed release APK or AAB through Android Studio/Gradle. Never commit signing keys or passwords.

## Windows EXE installer

```bash
npm install
npm run desktop:dev
npm run desktop:build
```

The Windows installer is written to `release/`. Build on Windows and test the installer on a clean Windows account/device before distribution.

## Important behavior and limitations

- Both native apps use the same Supabase URL and public publishable/anon key already used by the website. Never embed a Supabase service-role key in a client app.
- Internet access is required for Supabase authentication, cloud synchronization, and externally hosted libraries/fonts.
- The apps share accounts and cloud data with the website because they use the same Supabase project and user IDs.
- Local game state remains device-local until the existing app syncs it to Supabase; test simultaneous sessions and conflict behavior before public distribution.
- Native project folders are generated locally by Capacitor and are intentionally ignored until the first Android project is generated and reviewed.
- This scaffold is not a claim that an APK or EXE has already been compiled, signed, or runtime-tested.
