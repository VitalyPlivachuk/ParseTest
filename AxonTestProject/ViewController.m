//
//  ViewController.m
//  AxonTestProject
//
//  Created by Vitaly Plivachuk on 8/30/18.
//  Copyright © 2018 Vitaly Plivachuk. All rights reserved.
//

#import "ViewController.h"
#import "EmployeeModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSData *jsonData = [NSData.alloc initWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"employees" ofType:@"json"]];
    NSDictionary *json = [NSJSONSerialization
                           JSONObjectWithData:jsonData
                           options:NSJSONReadingMutableContainers
                           error:nil];
    NSDictionary *employees = json[@"employees"];
    NSMutableArray *employeesArray = [NSMutableArray.alloc init];
    
    [[employees allValues] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *emplDict = obj;
        EmployeeModel* empl = [EmployeeModel.alloc initWithDictionary:emplDict];
        [employeesArray addObject:empl];
    }];
}

@end
