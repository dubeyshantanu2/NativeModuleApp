#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ImageCompressionModule, NSObject)

RCT_EXTERN_METHOD(compressImage:(NSString *)imagePath resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)

@end
