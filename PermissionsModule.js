import {NativeModules} from 'react-native';

const {PermissionsModule} = NativeModules;

export const checkCameraPermission = async () => {
  try {
    const granted = await PermissionsModule.checkCameraPermission();
    return granted;
  } catch (e) {
    console.error(e);
    return false;
  }
};

export const checkMicrophonePermission = async () => {
  try {
    const granted = await PermissionsModule.checkMicrophonePermission();
    return granted;
  } catch (e) {
    console.error(e);
    return false;
  }
};

export const checkNotificationPermission = async () => {
  try {
    const granted = await PermissionsModule.checkNotificationPermission();
    return granted;
  } catch (e) {
    console.error(e);
    return false;
  }
};
