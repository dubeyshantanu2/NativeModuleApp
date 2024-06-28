import React from 'react';
import {Button, View, Alert, Linking} from 'react-native';
import {
  checkCameraPermission,
  checkMicrophonePermission,
  checkNotificationPermission,
} from './PermissionsModule';

const App = () => {
  const handleCheckCameraPermissions = async () => {
    const cameraGranted = await checkCameraPermission();
    console.log('Camera Permission:', cameraGranted);
    if (!cameraGranted) {
      Alert.alert(
        'Camera Permission Denied',
        'Please enable camera permission in settings',
        [
          {text: 'Cancel', style: 'cancel'},
          {text: 'Open Settings', onPress: () => Linking.openSettings()},
        ],
      );
    }
  };

  const handleCheckMicrophonePermissions = async () => {
    const microphoneGranted = await checkMicrophonePermission();
    console.log('Microphone Permission:', microphoneGranted);
    if (!microphoneGranted) {
      Alert.alert(
        'Microphone Permission Denied',
        'Please enable microphone permission in settings',
        [
          {text: 'Cancel', style: 'cancel'},
          {text: 'Open Settings', onPress: () => Linking.openSettings()},
        ],
      );
    }
  };

  const handleCheckNotificationPermissions = async () => {
    const notificationGranted = await checkNotificationPermission();
    console.log('Notification Permission:', notificationGranted);
    if (!notificationGranted) {
      Alert.alert(
        'Notification Permission Denied',
        'Please enable notification permission in settings',
        [
          {text: 'Cancel', style: 'cancel'},
          {text: 'Open Settings', onPress: () => Linking.openSettings()},
        ],
      );
    }
  };

  return (
    <View
      style={{
        flex: 1,
      }}>
      <View
        style={{
          flex: 1,
          backgroundColor: 'red',
          justifyContent: 'center',
          alignItems: 'center',
        }}>
        <Button
          title="Check Camera Permissions"
          onPress={handleCheckCameraPermissions}
        />
      </View>
      <View
        style={{
          flex: 1,
          backgroundColor: 'orange',
          justifyContent: 'center',
          alignItems: 'center',
        }}>
        <Button
          title="Check Microphone Permissions"
          onPress={handleCheckMicrophonePermissions}
        />
      </View>
      <View
        style={{
          flex: 1,
          backgroundColor: 'yellow',
          justifyContent: 'center',
          alignItems: 'center',
        }}>
        <Button
          title="Check Notification Permissions"
          onPress={handleCheckNotificationPermissions}
        />
      </View>
    </View>
  );
};

export default App;
