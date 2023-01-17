//
//  RCSHomeCellProtocol.h
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import "RCSProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RCSHomeItem;

@class UITableViewCell;

@protocol RCSHomeCellProtocol <RCSProtocol>

- (UITableViewCell *)update:(id<RCSHomeItem>)item;

@end

NS_ASSUME_NONNULL_END
