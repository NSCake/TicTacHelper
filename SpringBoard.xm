//
//  SpringBoard.xm
//  TicTacHelper
//  
//  Created by Tanner Bennett on 2021-09-30
//  Copyright © 2021 Tanner Bennett. All rights reserved.
//

#import "Interfaces.h"

@interface BBBulletinRequest
@property (nonatomic) NSString *title; 
@property (nonatomic) NSString *subtitle; 
@property (nonatomic) NSString *message;
@end


%hook BBServer
/// For iOS 11 and below
- (void)_publishBulletinRequest:(id)request forSectionID:(NSString *)bundleID
                forDestinations:(NSUInteger)destinations alwaysToLockScreen:(BOOL)alwaysToLockScreen {
	if ([bundleID isEqualToString:@"com.yikyak.2"]) {
		bundleID = @"com.nscake.tictac";
	}
    
    %orig;
}

- (void)_publishBulletinRequest:(id)arg1 forSectionID:(NSString *)bundleID forDestinations:(NSUInteger)destinations {
	if ([bundleID isEqualToString:@"com.yikyak.2"]) {
		bundleID = @"com.nscake.tictac";
	}
    
    %orig;
}

%end

%hook UNSUserNotificationServer
- (void)didReceiveDeviceToken:(id)token forBundleIdentifier:(NSString *)bundleID {
    if ([bundleID isEqualToString:@"com.yikyak.2"]) {
		bundleID = @"com.nscake.tictac";
	}
    
    %orig;
}
%end

// %hook UNSUserNotificationServerRemoteNotificationConnectionListener
// - (void)requestTokenForRemoteNotificationsForBundleIdentifier:(NSString *)bundleID withCompletionHandler:(id)completion {
//     if ([bundleID isEqualToString:@"com.nscake.tictac"]) {
// 		bundleID = @"com.yikyak.2";
// 	}
    
//     %orig;
// }
// %end

// %hook UNSPushRegistrationRepository
// - (void)setRegistration:(id)reg forBundleIdentifier:(NSString *)bundleID {
// 	if ([bundleID isEqualToString:@"com.yikyak.2"]) {
// 		bundleID = @"com.nscake.tictac";
// 	}
    
//     %orig;
// }

// - (id)registrationForBundleIdentifier:(NSString *)bundleID {
// 	if ([bundleID isEqualToString:@"com.yikyak.2"]) {
// 		bundleID = @"com.nscake.tictac";
// 	}
    
//     return %orig;
// }
// %end
