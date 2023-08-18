//
//  RCSDemoCell.m
//  RCSDemo
//
//  Created by shuai shao on 2023/5/11.
//

#import "RCSDemoCell.h"

@interface RCSDemoCell () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation RCSDemoCell

+ (void)updateCellHeight {
    NSNumber *height = [[NSUserDefaults standardUserDefaults] objectForKey:@"DemoCellHeight"];
    if (height.floatValue == 84) {
        height = @(244);
    } else {
        height = @(84);
    }
    [[NSUserDefaults standardUserDefaults] setValue:height forKey:@"DemoCellHeight"];
}

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

- (void)setDataModel:(RCMessageModel *)model {
    [super setDataModel:model];
    [self setAutoLayout];
    [self.tableView reloadData];
}

- (void)setAutoLayout {
    NSNumber *height = [[NSUserDefaults standardUserDefaults] objectForKey:@"DemoCellHeight"];
    if (height.floatValue == 84) {
        self.backgroundColor = [UIColor yellowColor];
    } else {
        self.backgroundColor = [UIColor redColor];
    }
}

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = self.items[indexPath.item];
    return cell;
}

#pragma mark - UITableViewDelegate -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 54;
}

#pragma mark - Property -

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.contentView.bounds];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.contentView addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *)items {
    if (!_items) {
        _items = [NSMutableArray array];
        [_items addObjectsFromArray:@[
            @"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",
        ]];
    }
    return _items;
}

@end
