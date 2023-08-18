//
//  RCSDemoCell.h
//  RCSDemo
//
//  Created by shuai shao on 2023/5/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCSDemoCell : RCMessageCell

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSMutableArray *items;

+ (void)updateCellHeight;

@end

NS_ASSUME_NONNULL_END
