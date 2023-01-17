//
//  RCMessageCell+Mark.m
//  RCSDemo
//
//  Created by shuai shao on 2023/1/12.
//

#import "RCMessageCell+Mark.h"

#import <objc/runtime.h>

@implementation RCMessageCell (Mark)

- (UIImageView *)markView {
    return objc_getAssociatedObject(self, @selector(markView));
}

- (void)setMarkView:(UIImageView * _Nonnull)markView {
    objc_setAssociatedObject(self, @selector(markView), markView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
