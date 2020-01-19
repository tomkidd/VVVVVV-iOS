//
//  sys_ios.m
//  VVVVVV-iOS
//
//  Created by Tom Kidd on 1/12/20.
//

#import <Foundation/Foundation.h>

#include <SDL_syswm.h>
#include "sys_ios.h"

#if TARGET_OS_TV
#import "VVVVVV_tvOS-Swift.h"
#else
#import "VVVVVV_iOS-Swift.h"
#endif

UIViewController* GetSDLViewController(SDL_Window *sdlWindow) {
    SDL_SysWMinfo systemWindowInfo;
    SDL_VERSION(&systemWindowInfo.version);
    if ( ! SDL_GetWindowWMInfo(sdlWindow, &systemWindowInfo)) {
        // error handle?
        return nil;
    }
    UIWindow *appWindow = systemWindowInfo.info.uikit.window;
    UIViewController *rootVC = appWindow.rootViewController;
    return rootVC;
}

void Sys_AddControls(SDL_Window *sdlWindow) {
    #if !TARGET_OS_TV
        // adding on-screen controls -tkidd
        SDL_uikitviewcontroller *rootVC = (SDL_uikitviewcontroller *)GetSDLViewController(sdlWindow);
        NSLog(@"root VC = %@",rootVC);

        [rootVC.view addSubview:[rootVC actionButtonWithRect:[rootVC.view frame]]];
        [rootVC.view addSubview:[rootVC joyStickWithRect:[rootVC.view frame]]];
        [rootVC.view addSubview:[rootVC enterButtonWithRect:[rootVC.view frame]]];
        [rootVC.view addSubview:[rootVC escapeButtonWithRect:[rootVC.view frame]]];
    #endif
}
