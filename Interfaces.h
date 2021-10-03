//
//  Interfaces.h
//  PushMe
//
//  Created by Tanner Bennett on 2021-09-30
//  Copyright © 2021 Tanner Bennett. All rights reserved.
//

#pragma mark Imports

#import <UIKit/UIKit.h>
#import <flex.h>

#pragma mark Interfaces


#pragma mark Macros



#define Alert(TITLE,MSG) [[[UIAlertView alloc] initWithTitle:(TITLE) \
message:(MSG) \
delegate:nil \
cancelButtonTitle:@"OK" \
otherButtonTitles:nil] show];

#define UIAlertController(title, msg) [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:1]
#define UIAlertControllerAddAction(alert, title, stl, code...) [alert addAction:[UIAlertAction actionWithTitle:title style:stl handler:^(id action) code]];
#define UIAlertControllerAddCancel(alert) [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]
#define ShowAlertController(alert, from) [from presentViewController:alert animated:YES completion:nil];
