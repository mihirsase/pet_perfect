# PetPerfect

This is a flutter application for a demonstrating bloc pattern architecture.
## APK Link
[Android apk download link](https://drive.google.com/file/d/1bxF8cGWyodpHMh1TLArHA_mfQfr70zuo/view?usp=sharing)


## Project Structure

- **.screens** : All the main screens for the app goes into this package
- **.blocs** : All business logic is inside these files
- **.components** : All reusable widgets are stored in this package
    - **.atoms** : Atoms are completely stateless reusable components.
    - **.molecules** : Molecules are stateful reusable components.
    - **.organisms** : Organisms have their own state,bloc and probably won't be used again.
- **.models** : All the blueprint files for the app goes into this package
- **.services** : All classes which provides additional help goes in this package

## Third party packages used in the project

- **flutter_bloc** : Used for separating business logic from ui code
- **dio** : Used for making REST API requests
- **hive + hive_flutter** : Used to persist some user data
- **video_player** : Used to play videos in the app
- **path_provider** : Gives a path to store user data