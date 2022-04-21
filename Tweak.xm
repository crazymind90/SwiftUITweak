// By @CrazyMind90

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>



#pragma GCC diagnostic ignored "-Wunused-variable"
#pragma GCC diagnostic ignored "-Wprotocol"
#pragma GCC diagnostic ignored "-Wmacro-redefined"
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
#pragma GCC diagnostic ignored "-Wincomplete-implementation"
#pragma GCC diagnostic ignored "-Wunknown-pragmas"
#pragma GCC diagnostic ignored "-Wformat"
#pragma GCC diagnostic ignored "-Wunknown-warning-option"
#pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
#pragma GCC diagnostic ignored "-Wunused-value"
#pragma GCC diagnostic ignored "-Wunused-function"


#define rgbValue
#define UIColorFromHEX(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

 
static UIViewController *_topMostController(UIViewController *cont) {
UIViewController *topController = cont;
 while (topController.presentedViewController) {
 topController = topController.presentedViewController;
 }
 if ([topController isKindOfClass:[UINavigationController class]]) {
 UIViewController *visible = ((UINavigationController *)topController).visibleViewController;
 if (visible) {
topController = visible;
 }
}
 return (topController != cont ? topController : nil);
 }
 static UIViewController *topMostController() {
 UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
 UIViewController *next = nil;
  while ((next = _topMostController(topController)) != nil) {
 topController = next;
 }
 return topController;
}





#import <SwiftUITweak-Swift.h>

 %hook UIApplication
-(void)finishedTest:(id)arg1 extraResults:(id)arg2 {

  %orig; 

        SwiftUIToObjc *Swift = [[SwiftUIToObjc alloc] init];
        [topMostController() presentViewController:[Swift SUIView] animated:YES completion:nil];

}
%end




















// 