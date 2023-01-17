//
//  RCSHomeCellProtocol.h
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RCSHomeItemProtocol;

@class UITableViewCell;

@protocol RCSHomeCellProtocol <NSObject>

- (UITableViewCell *)update:(id<RCSHomeItemProtocol>)item;

@end

NS_ASSUME_NONNULL_END
