//
//  RCSHomeItem.m
//  RCSDemo
//
//  Created by shuai shao on 2023/1/17.
//

#import "RCSHomeItem.h"

@interface RCSHomeItem ()

@property (nonatomic, copy) NSMutableSet<Class> *itemSets;

@end

@implementation RCSHomeItem

+ (instancetype)shared {
    static RCSHomeItem *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[RCSHomeItem alloc]init];
    });
    return instance;
}

- (void)registerClass:(Class)itemClass {
    if ([itemClass conformsToProtocol:@protocol(RCSHomeItem)])
        [self.itemSets addObject:itemClass];
}

- (NSMutableSet *)itemSets {
    return _itemSets?:(_itemSets=[NSMutableSet set]);
}

- (NSArray<Class> *)classes {
    return [[self.itemSets allObjects] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        Class<RCSHomeItem> item1 = obj1;
        Class<RCSHomeItem> item2 = obj2;
        return [item1 index] < [item2 index] ? NSOrderedAscending : NSOrderedDescending;
    }];
}

@end
