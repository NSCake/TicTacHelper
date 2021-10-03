//
//  Tweak.xm
//  TicTacHelper
//
//  Created by Tanner Bennett on 2021-09-30
//  Copyright © 2021 Tanner Bennett. All rights reserved.
//

#import "Interfaces.h"


// %hook APSPushHistory
// - (void)receivedPushWithTopic:(NSString *)topic token:(id)token payload:(id)pl timestamp:(id)ts {
//     if ([topic isEqualToString:@"com.yikyak.2"]) {
//         topic = @"com.nscake.tictac";
//     }
    
//     %orig;
// }
// %end

%hook APSConnectionServer
- (id)enabledTopics {
    NSSet<NSString *> *topics = %orig;
    return [topics setByAddingObject:@"com.nscake.tictac"];
}
%end

%hook APSMessage
// - (NSString *)topic {
//     NSString *topic = %orig;
//     if ([topic isEqualToString:@"com.yikyak.2"]) {
//         topic = @"com.nscake.tictac";
//     }
    
//     return topic;
// }

- (id)initWithTopic:(NSString *)topic userInfo:(id)info {
    if ([topic isEqualToString:@"com.yikyak.2"]) {
        topic = @"com.nscake.tictac";
    }
    
    return %orig;
}

- (id)initWithDictionary:(NSMutableDictionary *)dict xpcMessage:(id)msg {
    @throw NSInternalInconsistencyException;
    dict = dict.mutableCopy;
    if ([dict[@"APSMessageTopic"] isEqualToString:@"com.yikyak.2"]) {
        dict[@"APSMessageTopic"] = @"com.nscake.tictac";
    }
    
    return %orig;
}
%end

// %hook NSDictionary
// - (id)objectForKey:(NSString *)key {
//     if ([key isEqualToString:@"APSMessageTopic"]) {
//         NSString *topic = self[key];
//         if ([topic isEqualToString:@"com.yikyak.2"]) {
//             return @"com.nscake.tictac";
//         }
//     }
    
//     return %orig;
// }
// %end
