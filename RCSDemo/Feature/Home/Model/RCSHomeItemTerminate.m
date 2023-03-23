//
//  RCSHomeItemTerminate.m
//  RCSDemo
//
//  Created by shuai shao on 2023/3/23.
//

#import <mach/mach.h>

#import "RCSHomeItem.h"
#import "RCSHomeItemTerminate.h"

@interface RCSHomeItemTerminate () <RCSHomeItem>

@end

@implementation RCSHomeItemTerminate

+ (void)load {
//    [[RCSHomeItem shared] registerClass:[self class]];
}

- (instancetype)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onTerminate)
                                                     name:UIApplicationWillTerminateNotification
                                                   object:nil];
    }
    return self;
}

- (void)onTerminate {
    printf("on app terminated\n");
    thread_act_array_t threads;
    mach_msg_type_number_t thread_count = 0;
    const task_t this_task = mach_task_self();
    kern_return_t kr = task_threads(this_task, &threads, &thread_count);
    if(kr != KERN_SUCCESS) {
        printf("Fail to get information of all threads\n");
    }
    mach_port_t main_thread = mach_thread_self();
    for (int i = thread_count-1; i >= 0; i --) {
        thread_act_t thread = threads[i];
        if (thread == main_thread) continue;
        if ([self isRongCloudIMThread:thread]) {
            thread_terminate(thread);
        }
        printf("terminate thread %d\n", thread);
    }
}

- (BOOL)isRongCloudIMThread:(thread_act_t)thread {
    // Call Stack contain RCIMLibCore
    return YES;
}

#pragma mark - HomeItem -

+ (NSInteger)index {
    return 10008;
}

- (NSString *)title {
    return @"杀进程";
}

- (NSString *)identifier {
    return kNormalCellIdentifier;
}

- (void)performActionWithSender:(nullable id)sender {
    SEL selector = NSSelectorFromString(@"terminateWithSuccess");
    [[UIApplication sharedApplication] performSelector:selector];
}

@end
