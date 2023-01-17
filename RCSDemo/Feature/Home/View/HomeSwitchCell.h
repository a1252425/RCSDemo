//
//  HomeSwitchCell.h
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import <UIKit/UIKit.h>

#import "RCSHomeCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeSwitchCell : UITableViewCell <RCSHomeCellProtocol>

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UISwitch *switchButton;

@end

NS_ASSUME_NONNULL_END
