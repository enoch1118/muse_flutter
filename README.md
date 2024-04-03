


https://github.com/enoch1118/muse_flutter/assets/54224095/85074721-37d2-4394-81e0-7cc2bbc1d8eb



# Google Gemini Flutter App

This is a Flutter application that clones the functionality of the Google Gemini app. It allows users to interact with the Gemini API and perform various operations.

## Prerequisites

Before running this application, you'll need to have the following installed:

- Flutter SDK
- Android Studio or Xcode (for running on emulators or physical devices)

## Setup

1. Clone the repository to your local machine:

```
git clone https://github.com/enoch1118/muse_flutter.git](https://github.com/enoch1118/muse_flutter.git
```

2. Navigate to the project directory:

```
cd muse_flutter
```

3. Create a `.env` file in the project root directory and add your Gemini API key:

```
GEMINI_API_KEY=your_api_key_here
```

Replace `your_api_key_here` with your actual Gemini API key.

4. Run the following commands to install dependencies and generate necessary files:

```
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

5. For iOS users, navigate to the `ios` directory and run:

```
pod install
```

## Running the App

1. Connect a physical device or start an emulator/simulator.

2. Run the app with the following command:

```
flutter run
```


## License

This project is licensed under the [MIT License](LICENSE).
