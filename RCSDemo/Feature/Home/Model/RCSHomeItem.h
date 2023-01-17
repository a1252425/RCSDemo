//
//  RCSHomeItem.h
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import "RCSProtocol.h"

#define kNormalCellIdentifier @"NormalCell"
#define kSwitchCellIdentifier @"SwitchCell"

NS_ASSUME_NONNULL_BEGIN

@protocol RCSHomeItem <RCSProtocol>

+ (NSInteger)index;

- (NSString *)title;

- (NSString *)identifier;

- (void)performActionWithSender:(nullable id)sender;

@optional

- (NSString *)storageKey;

- (NSValue *)storageValue;

@end

@interface RCSHomeItem : NSObject

@property (nonatomic, copy, readonly) NSArray<Class> *classes;

+ (instancetype)shared;

- (void)registerClass:(Class)itemClass;

@end

NS_ASSUME_NONNULL_END
