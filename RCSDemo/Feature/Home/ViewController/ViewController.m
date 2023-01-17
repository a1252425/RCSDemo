//
//  ViewController.m
//  RCSDemo
//
//  Created by shuai shao on 2022/12/26.
//

#import "RCSSUser.h"

#import "ViewController.h"
#import "RCSConversationViewController.h"
#import "RCSChatViewController.h"

#import "RCSHomeItem.h"
#import "RCSHomeViewModel.h"
#import "RCSHomeCellProtocol.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) RCSHomeViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showUserIfNeeded];
    });
}

- (IBAction)testAction {
    RCSConversationViewController *controller = [[RCSConversationViewController alloc] initWithDisplayConversationTypes:@[@(ConversationType_PRIVATE), @(ConversationType_GROUP)] collectionConversationType:@[]];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)showUserIfNeeded {
    NSString *token = [[NSUserDefaults standardUserDefaults] stringForKey:@"IM_Token"];
    if (token) {
        return [self connectIMWithToken:token];
    }
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Users" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSArray *items = dict[@"items"];
    
    NSMutableArray<RCSSUser *> *users = [NSMutableArray array];
    for (NSDictionary *item in items) {
        RCSSUser *user = [[RCSSUser alloc] init];
        [user setValuesForKeysWithDictionary:item];
        [users addObject:user];
    }
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"选择用户" message:@"选择用户" preferredStyle:UIAlertControllerStyleActionSheet];
    for (RCSSUser *user in users) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:user.name style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[NSUserDefaults standardUserDefaults] setObject:user.identifier forKey:@"userId"];
            [[NSUserDefaults standardUserDefaults] setObject:user.name forKey:@"userName"];
            [[NSUserDefaults standardUserDefaults] setObject:user.portrait?:@"" forKey:@"userPortrait"];
            [[NSUserDefaults standardUserDefaults] setObject:user.token forKey:@"IM_Token"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self connectIMWithToken:user.token];
        }];
        [controller addAction:action];
    }
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        exit(999);
    }];
    [controller addAction:action];
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)connectIMWithToken:(NSString *)token {
    [RCIM.sharedRCIM connectWithToken:token dbOpened:^(RCDBErrorCode code) {
    } success:^(NSString *userId) {
        NSLog(@"userId:%@", userId);
        [self didConnect:userId];
    } error:^(RCConnectErrorCode errorCode) {
        NSLog(@"connect error: %d", (int)errorCode);
    }];
}

- (void)didConnect:(NSString *)userId {
    // TODO
}

- (RCSHomeViewModel *)viewModel {
    return _viewModel?:(_viewModel=[[RCSHomeViewModel alloc] init]);
}

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<RCSHomeItemProtocol> item = self.viewModel.items[indexPath.row];
    UITableViewCell<RCSHomeCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:item.identifier forIndexPath:indexPath];
    return [cell update:item];
}

#pragma mark - UITableViewDelegate -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel.items[indexPath.row] performActionWithSender:self];
}

@end
