import {NativeModules} from 'react-native';
const {ImageCompressionModule} = NativeModules;

ImageCompressionModule.compressImage(imagePath)
  .then(compressedPath => {
    console.log('Compressed image path:', compressedPath);
  })
  .catch(error => {
    console.error('Image compression error:', error);
  });
