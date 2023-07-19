//
//  RCSDemoCell.m
//  RCSDemo
//
//  Created by shuai shao on 2023/5/11.
//

#import "RCSDemoCell.h"

@implementation RCSDemoCell

+ (void)updateCellHeight {
    NSNumber *height = [[NSUserDefaults standardUserDefaults] objectForKey:@"DemoCellHeight"];
    if (height.floatValue == 84) {
        height = @(244);
    } else {
        height = @(84);
    }
    [[NSUserDefaults standardUserDefaults] setValue:height forKey:@"DemoCellHeight"];
}

+ (CGSize)sizeForMessageModel:(RCMessageModel *)model withCollectionViewWidth:(CGFloat)collectionViewWidth referenceExtraHeight:(CGFloat)extraHeight {
    NSNumber *height = [[NSUserDefaults standardUserDefaults] objectForKey:@"DemoCellHeight"];
    return CGSizeMake(collectionViewWidth, height.floatValue);
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
}

- (void)setDataModel:(RCMessageModel *)model {
    [super setDataModel:model];
    [self setAutoLayout];
}

- (void)setAutoLayout {
    NSNumber *height = [[NSUserDefaults standardUserDefaults] objectForKey:@"DemoCellHeight"];
    if (height.floatValue == 84) {
        self.backgroundColor = [UIColor yellowColor];
    } else {
        self.backgroundColor = [UIColor redColor];
    }
}

@end
