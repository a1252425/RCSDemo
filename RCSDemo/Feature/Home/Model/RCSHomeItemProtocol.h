//
//  RCSHomeItemProtocol.h
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RCSHomeItemProtocol <NSObject>

+ (NSInteger)index;

- (NSString *)title;

- (NSString *)identifier;

- (void)performActionWithSender:(nullable id)sender;

@optional

- (NSString *)storageKey;

- (NSValue *)storageValue;

@end

NS_ASSUME_NONNULL_END
