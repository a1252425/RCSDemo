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

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) RCSHomeViewModel *viewModel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showUserIfNeeded];
    });
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

@end
