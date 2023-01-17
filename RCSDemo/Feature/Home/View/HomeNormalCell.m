//
//  HomeNormalCell.m
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import "HomeNormalCell.h"

#import "RCSHomeItem.h"

@implementation HomeNormalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UITableViewCell *)update:(id<RCSHomeItem>)item {
    self.titleLabel.text = [item title];
    return self;
}

@end
