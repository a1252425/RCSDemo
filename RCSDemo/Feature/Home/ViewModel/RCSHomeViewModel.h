//
//  RCSHomeViewModel.h
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RCSHomeItem;

@interface RCSHomeViewModel : NSObject

@property (nonatomic, copy) NSArray<id<RCSHomeItem>> *items;

@end

NS_ASSUME_NONNULL_END
