//
//  RCSHomeViewModel.m
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import "RCSHomeItem.h"
#import "RCSHomeViewModel.h"

@implementation RCSHomeViewModel

- (NSArray<id<RCSHomeItem>> *)items {
    if (_items) return _items;
    NSMutableArray *items = [NSMutableArray array];
    for(Class aClass in RCSHomeItem.shared.classes) {
        if ([aClass conformsToProtocol:@protocol(RCSHomeItem)]) {
            [items addObject:[[aClass alloc] init]];
        }
    }
    return _items = items;
}

@end
