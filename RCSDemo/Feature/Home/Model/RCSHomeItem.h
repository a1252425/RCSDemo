//
//  RCSHomeItem.h
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import <Foundation/Foundation.h>

#import "RCSHomeItemProtocol.h"

#define kNormalCellIdentifier @"NormalCell"
#define kSwitchCellIdentifier @"SwitchCell"

NS_ASSUME_NONNULL_BEGIN

@interface RCSHomeItem : NSObject

@property (nonatomic, copy, readonly) NSArray<Class> *classes;

+ (instancetype)shared;

- (void)registerClass:(Class)itemClass;

@end

NS_ASSUME_NONNULL_END
