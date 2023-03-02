//
//  RCChatSessionInputBarControl+bottomBar.m
//  RongIMKit_Demo
//
//  Created by Jue on 2021/9/16.
//  Copyright © 2021 RC. All rights reserved.
//

#import "RCChatSessionInputBarControl+bottomBar.h"
#import <objc/runtime.h>
#import "RCConversationViewController+bottomBar.h"

@implementation RCChatSessionInputBarControl (bottomBar)


+(void)load {
    //只执行一次这个方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //替换 setFrame
        NSString *oldSelStr = @"setFrame:";
        NSString *newSelStr = @"setBottomBarFrame:";
        Method originalMethod = class_getInstanceMethod(self, NSSelectorFromString(oldSelStr));
        Method swizzledMethod = class_getInstanceMethod(self, NSSelectorFromString(newSelStr));
        
        BOOL didAddMethod = class_addMethod(self,
                                            NSSelectorFromString(oldSelStr),
                                            method_getImplementation(swizzledMethod),
                                            method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            class_replaceMethod(self,
                                NSSelectorFromString(newSelStr),
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

-(void)setBottomBarFrame:(CGRect)frame{
    if(self.frame.size.height != frame.size.height){
        [self setBottomBarFrame:frame];
        return;
    }
    frame.origin.y -= HIGH_BOTTOM_BAR;
    [self setBottomBarFrame:frame];
}

@end
