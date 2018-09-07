//
//  EmployeesTableViewController.h
//  AxonTestProject
//
//  Created by Vitaly Plivachuk on 8/30/18.
//  Copyright © 2018 Vitaly Plivachuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmployeeModel.h"

@interface EmployeesTableViewController : UITableViewController
@property (copy, nonatomic) NSArray<EmployeeModel *>* employees;
@end
