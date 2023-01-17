//
//  HomeSwitchCell.m
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import "HomeSwitchCell.h"

#import "RCSHomeItemProtocol.h"

@interface HomeSwitchCell ()

@property (nonatomic, weak) id<RCSHomeItemProtocol> item;

@end

@implementation HomeSwitchCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UITableViewCell *)update:(id<RCSHomeItemProtocol>)item {
    self.titleLabel.text = [item title];
    BOOL isOn = [(NSNumber *)[item storageValue] boolValue];
    [self.switchButton setOn:isOn animated:NO];
    self.item = item;
    return self;
}

- (IBAction)switchButtonDidChanged:(UISwitch *)switchButton {
    [self.item performActionWithSender:switchButton];
}

@end
