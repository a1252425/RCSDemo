//
//  Dog.m
//  RCSDemoTests
//
//  Created by shuai shao on 2022/12/27.
//

#import "Dog.h"

@implementation Dog

- (NSString *)callSomething:(NSString *)content {
    return [NSString stringWithFormat:@"dog call %@", content];
}

@end
