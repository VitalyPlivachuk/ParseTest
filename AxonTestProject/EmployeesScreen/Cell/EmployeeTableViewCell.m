//
//  employeeTableViewCell.m
//  AxonTestProject
//
//  Created by Vitaly Plivachuk on 8/30/18.
//  Copyright © 2018 Vitaly Plivachuk. All rights reserved.
//

#import "EmployeeTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation EmployeeTableViewCell

- (void)setEmployee:(EmployeeModel *)employee{
    _employee = employee;
    [_avatarImageView sd_setImageWithURL:[_employee avatar] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
    [_nameLabel setText:[employee firstName]];
    [_secondNameLabel setText:[employee secondName]];
}

@end
