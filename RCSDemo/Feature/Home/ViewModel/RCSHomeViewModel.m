//
//  RCSHomeViewModel.m
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import "RCSHomeViewModel.h"

#import "RCSHomeItem.h"
#import "RCSHomeItemProtocol.h"

@implementation RCSHomeViewModel

- (NSArray<id<RCSHomeItemProtocol>> *)items {
    if (_items) return _items;
    NSMutableArray *items = [NSMutableArray array];
    for(Class aClass in RCSHomeItem.shared.classes) {
        if ([aClass conformsToProtocol:@protocol(RCSHomeItemProtocol)]) {
            [items addObject:[[aClass alloc] init]];
        }
    }
    return _items = items;
}

@end
