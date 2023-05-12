//
//  RCSChatViewController+Test.m
//  RCSDemo
//
//  Created by shuai shao on 2023/5/11.
//

#import "RCSChatViewController+Test.h"

@implementation RCSChatViewController (Test)

- (void)activeActions {
    [self addGesture];
}

- (void)addGesture {
    // 需要配合 RCDemoCell 使用 registerCell
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapActionHandler:)];
    gesture.numberOfTapsRequired = 2;
    [self.navigationController.navigationBar addGestureRecognizer:gesture];
}

- (void)tapActionHandler:(UITapGestureRecognizer *)gesture {
    NSNumber *height = [[NSUserDefaults standardUserDefaults] objectForKey:@"DemoCellHeight"];
    if (height.intValue == 84) {
        [[NSUserDefaults standardUserDefaults] setObject:@(244) forKey:@"DemoCellHeight"];
    } else {
        [[NSUserDefaults standardUserDefaults] setObject:@(84) forKey:@"DemoCellHeight"];
    }
    
    RCMessageModel *model = self.conversationDataRepository.lastObject;
    model.cellSize = CGSizeZero;
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.conversationDataRepository.count-1 inSection:0];
    [self.conversationMessageCollectionView reloadItemsAtIndexPaths:@[indexPath]];
    [self scrollToBottomAnimated:YES];
    
    UIColor *cellColor = height.intValue == 84 ? [UIColor redColor] : [UIColor clearColor];
    [self.conversationMessageCollectionView cellForItemAtIndexPath:indexPath].backgroundColor = cellColor;
}

@end
