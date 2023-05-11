//
//  RCSDemoCell.m
//  RCSDemo
//
//  Created by shuai shao on 2023/5/11.
//

#import "RCSDemoCell.h"

@implementation RCSDemoCell

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

@end
