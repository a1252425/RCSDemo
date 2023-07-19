//
//  HomeViewController.m
//  RCSDemo
//
//  Created by shuai shao on 2022/12/26.
//

#import "RCSHomeItem.h"
#import "RCSHomeViewModel.h"
#import "RCSHomeCellProtocol.h"

#import "HomeViewController+Login.h"

#import <objc/runtime.h>

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) RCSHomeViewModel *viewModel;

@property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _queue = dispatch_queue_create("cn.ss.queue", NULL);
    
//    [self testCrash];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<RCSHomeItem> item = self.viewModel.items[indexPath.row];
    UITableViewCell<RCSHomeCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:item.identifier forIndexPath:indexPath];
    return [cell update:item];
}

#pragma mark - UITableViewDelegate -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel.items[indexPath.row] performActionWithSender:self];
}

#pragma mark - ViewModel -

- (RCSHomeViewModel *)viewModel {
    return _viewModel?:(_viewModel=[[RCSHomeViewModel alloc] init]);
}

- (void)testCrash {
//    [NSTimer scheduledTimerWithTimeInterval:0.09 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        @autoreleasepool {
//            NSMutableArray *msgs = [NSMutableArray array];
//            for (int i = 0; i < 100; i++) {
//                RCTextMessage *content = [RCTextMessage messageWithContent:@"test"];
//                RCMessage *receiveMsg = [[RCMessage alloc] initWithType:ConversationType_ULTRAGROUP targetId:@"id" direction:MessageDirection_RECEIVE content:content];
//                receiveMsg.messagePushConfig.iOSConfig.category = @"HW";
//                [msgs addObject:receiveMsg];
//            }
//            dispatch_async(self.queue, ^{
//                [self onMessageUpdate:msgs];
//            });
//        }
//    }];
}

- (void)onMessageUpdate:(NSArray *)msgs {
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"%@", @(msgs.count));
//    });
}

@end
