abstract class AppEvent {
  const AppEvent();
}

class AppInitialized extends AppEvent {}

class UserLoggedOut extends AppEvent {}
