//
//  EmployeeViewController.m
//  AxonTestProject
//
//  Created by Vitaly Plivachuk on 8/30/18.
//  Copyright © 2018 Vitaly Plivachuk. All rights reserved.
//

#import "EmployeeViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface EmployeeViewController ()

@end

@implementation EmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_ageLabel setText: [NSString.alloc initWithFormat:@"%ld years", self.employee.age]];
    [_nameLabel setText:self.employee.firstName];
    [_secondNameLabel setText:self.employee.secondName];
    [_avatarImageView sd_setImageWithURL:self.employee.avatar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
