//
//  MainViewController.m
//  DesignPatternsDemo
//
//  Created by 崔宗寅 on 2017/8/23.
//  Copyright © 2017年 崔宗寅. All rights reserved.
//

#import "MainViewController.h"

static const NSString *strSimpleFactory = @"Simple Factory";

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *tbDesignPattern;
}
@property (nonatomic, strong) NSMutableArray *arrDesignPatternList;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Design Patterns";
    
    [self initData];
    
    [self initSubviews];
    // Do any additional setup after loading the view.
}

- (void) initData {
    [self.arrDesignPatternList addObject:strSimpleFactory];
}

- (void) initSubviews {
    
    tbDesignPattern = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    [tbDesignPattern setBackgroundColor:[UIColor whiteColor]];
    tbDesignPattern.delegate = self;
    tbDesignPattern.dataSource = self;
    [self.view addSubview:tbDesignPattern];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableview Delegate
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrDesignPatternList.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *DesignPatternCellIdentifier = @"DesignPatternCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DesignPatternCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DesignPatternCellIdentifier];
    }
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    [cell.textLabel setText:self.arrDesignPatternList[indexPath.row]];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self JumpToSpecificPageWithIndex:indexPath.row];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Private Method
- (void) JumpToSpecificPageWithIndex: (NSInteger) index {
    
}


#pragma mark - Lazy loading
- (NSMutableArray *) arrDesignPatternList {
    if (_arrDesignPatternList == nil) {
        _arrDesignPatternList = [NSMutableArray array];
    }
    return _arrDesignPatternList;
}

@end
