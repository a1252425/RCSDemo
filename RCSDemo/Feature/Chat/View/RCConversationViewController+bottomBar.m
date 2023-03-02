//
//  RCConversationViewController+bottomBar.m
//  RongIMKit_Demo
//
//  Created by Jue on 2021/9/16.
//  Copyright © 2021 RC. All rights reserved.
//

#import "RCConversationViewController+bottomBar.h"
#import <objc/runtime.h>

@implementation RCConversationViewController (bottomBar)

+(void)load {
    //只执行一次这个方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //替换 viewWillAppear
        NSString *oldSelStr1 = @"viewWillAppear:";
        NSString *newSelStr1 = @"viewWillAppearAddBottomBar:";
        [self.class exchangeInstanceMethodWithSelfClass:self originalSelector:NSSelectorFromString(oldSelStr1) swizzledSelector:NSSelectorFromString(newSelStr1)];
        
        
        //替换 viewWillAppear
        NSString *oldSelStr2 = @"chatInputBar:shouldChangeFrame:";
        NSString *newSelStr2 = @"chatInputBarAddBottomBar:shouldChangeFrame:";
        [self.class exchangeInstanceMethodWithSelfClass:self originalSelector:NSSelectorFromString(oldSelStr2) swizzledSelector:NSSelectorFromString(newSelStr2)];
    });
}

- (void)viewWillAppearAddBottomBar:(BOOL)animated {
   
    if (!self.bottomBarView) {
        CGRect frame = self.conversationMessageCollectionView.frame;
        frame.size.height -= HIGH_BOTTOM_BAR;
        CGRect inputBarFrame = self.chatSessionInputBarControl.frame;
        self.conversationMessageCollectionView.frame = frame;
        self.bottomBarView = [[UIView alloc] initWithFrame:CGRectMake(0, inputBarFrame.origin.y + inputBarFrame.size.height, inputBarFrame.size.width, HIGH_BOTTOM_BAR)];
        [self.bottomBarView setBackgroundColor:[UIColor redColor]];
        [self.view addSubview:self.bottomBarView];
       
    }
    [self viewWillAppearAddBottomBar:animated];
}

- (void)chatInputBarAddBottomBar:(RCChatSessionInputBarControl *)chatInputBar shouldChangeFrame:(CGRect)frame{
    [self chatInputBarAddBottomBar:chatInputBar shouldChangeFrame:frame];
    self.bottomBarView.frame = CGRectMake(0, frame.origin.y + frame.size.height, frame.size.width, HIGH_BOTTOM_BAR);
}


+ (void)exchangeInstanceMethodWithSelfClass:(Class)selfClass
                          originalSelector:(SEL)originalSelector
                          swizzledSelector:(SEL)swizzledSelector {
   
   Method originalMethod = class_getInstanceMethod(selfClass, originalSelector);
   Method swizzledMethod = class_getInstanceMethod(selfClass, swizzledSelector);
   BOOL didAddMethod = class_addMethod(selfClass,
                                       originalSelector,
                                       method_getImplementation(swizzledMethod),
                                       method_getTypeEncoding(swizzledMethod));
   if (didAddMethod) {
       class_replaceMethod(selfClass,
                           swizzledSelector,
                           method_getImplementation(originalMethod),
                           method_getTypeEncoding(originalMethod));
   } else {
       method_exchangeImplementations(originalMethod, swizzledMethod);
   }
}

- (void)setBottomBarView:(UIView *)bottomBarView{
    objc_setAssociatedObject(self, @selector(bottomBarView), bottomBarView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)bottomBarView {
    return objc_getAssociatedObject(self, @selector(bottomBarView));
}





@end
