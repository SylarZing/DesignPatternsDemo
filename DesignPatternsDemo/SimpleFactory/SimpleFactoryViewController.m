//
//  SimpleFactoryViewController.m
//  DesignPatternsDemo
//
//  Created by 崔宗寅 on 2017/9/4.
//  Copyright © 2017年 崔宗寅. All rights reserved.
//

#import "SimpleFactoryViewController.h"

#import "CalFactory.h"

static const CGFloat fControlInterval = 10;
static const CGFloat fButtonHeight = 45;

@interface SimpleFactoryViewController ()
{
    UILabel *lblA;
    UILabel *lblB;
    UITextField *txtA;
    UITextField *txtB;
    UILabel *lblResult;
    
    UIButton *btnAdd;
    UIButton *btnSub;

    UIButton *btnReset;
}

@end

@implementation SimpleFactoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self initSubviews];
    // Do any additional setup after loading the view.
}

- (void) initSubviews {
    lblA = [[UILabel alloc] initWithFrame:CGRectMake(fControlInterval, kStatusBarHeight + kNavigationBarHeight + fControlInterval, fControlInterval * 2, fControlInterval * 2)];
    [lblA setBackgroundColor:[UIColor clearColor]];
    [lblA setText:@"A:"];
    [lblA setTextColor:[UIColor blackColor]];
    [self.view addSubview:lblA];
    
    txtA = [[UITextField alloc] initWithFrame:CGRectMake(lblA.frame.origin.x + lblA.frame.size.width + fControlInterval, lblA.frame.origin.y, kScreenWidth - lblA.frame.size.width - fControlInterval * 3, lblA.frame.size.height)];
    [txtA setBackgroundColor:[UIColor darkGrayColor]];
    [txtA setTextAlignment:NSTextAlignmentCenter];
    [txtA setText:@"0"];
    [txtA setTextColor:[UIColor whiteColor]];
    [txtA setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:txtA];
    
    lblB = [[UILabel alloc] initWithFrame:CGRectMake(fControlInterval, lblA.frame.origin.y + lblA.frame.size.height + fControlInterval, fControlInterval * 2, fControlInterval * 2)];
    [lblB setBackgroundColor:[UIColor clearColor]];
    [lblB setText:@"B:"];
    [lblB setTextColor:[UIColor blackColor]];
    [self.view addSubview:lblB];
    
    txtB = [[UITextField alloc] initWithFrame:CGRectMake(lblB.frame.origin.x + lblB.frame.size.width + fControlInterval, lblB.frame.origin.y, kScreenWidth - lblB.frame.size.width - fControlInterval * 3, lblB.frame.size.height)];
    [txtB setBackgroundColor:[UIColor darkGrayColor]];
    [txtB setTextAlignment:NSTextAlignmentCenter];
    [txtB setText:@"0"];
    [txtB setTextColor:[UIColor whiteColor]];
    [txtB setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:txtB];
    
    lblResult = [[UILabel alloc] initWithFrame:CGRectMake(fControlInterval, lblB.frame.origin.y + lblB.frame.size.height + fControlInterval, kScreenWidth - fControlInterval * 2, 30)];
    [lblResult setBackgroundColor:[UIColor darkGrayColor]];
    [lblResult setText:@"0"];
    [lblResult setTextColor:[UIColor whiteColor]];
    [lblResult setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:lblResult];
    
    btnAdd = [[UIButton alloc] initWithFrame:CGRectMake(fControlInterval, lblResult.frame.origin.y + lblResult.frame.size.height + fControlInterval, kScreenWidth - fControlInterval * 2, fButtonHeight)];
    [btnAdd setBackgroundColor:[UIColor blueColor]];
    [btnAdd setTitle:@"Add" forState:UIControlStateNormal];
    [btnAdd setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnAdd addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnAdd];
    
    btnSub = [[UIButton alloc] initWithFrame:CGRectMake(fControlInterval, btnAdd.frame.origin.y + btnAdd.frame.size.height + fControlInterval, kScreenWidth - fControlInterval * 2, fButtonHeight)];
    [btnSub setBackgroundColor:[UIColor blueColor]];
    [btnSub setTitle:@"Sub" forState:UIControlStateNormal];
    [btnSub setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnSub addTarget:self action:@selector(sub) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSub];
    
    btnReset = [[UIButton alloc] initWithFrame:CGRectMake(fControlInterval, btnSub.frame.origin.y + btnSub.frame.size.height + fControlInterval, kScreenWidth - fControlInterval * 2, fButtonHeight)];
    [btnReset setBackgroundColor:[UIColor blueColor]];
    [btnReset setTitle:@"Reset" forState:UIControlStateNormal];
    [btnReset setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnReset addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnReset];
}

- (void) refreshUI {
    [txtA setText:@"0"];
    [txtB setText:@"0"];
    [lblResult setText:@"0"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButton Action
- (void) add {
    float a = [txtA.text floatValue];
    float b = [txtB.text floatValue];
    
    float result = [[CalFactory initAddClass] operationWithA:a andB:b];
    [lblResult setText:[NSString stringWithFormat:@"%f", result]];
    
}

- (void) sub {
    
    float a = [txtA.text floatValue];
    float b = [txtB.text floatValue];
    
    float result = [[CalFactory initSubClass] operationWithA:a andB:b];
    [lblResult setText:[NSString stringWithFormat:@"%f", result]];
}

- (void) reset {
    [self refreshUI];
}

@end
