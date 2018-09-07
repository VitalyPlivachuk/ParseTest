//
//  EmployeesTableViewController.m
//  AxonTestProject
//
//  Created by Vitaly Plivachuk on 8/30/18.
//  Copyright © 2018 Vitaly Plivachuk. All rights reserved.
//

#import "EmployeesTableViewController.h"
#import "employeeTableViewCell.h"
#import "Networking.h"
#import "EmployeeViewController.h"

@interface EmployeesTableViewController ()

@end

@implementation EmployeesTableViewController

NSString *const reuseIdentifier = @"cell";


- (void)viewDidLoad{
    [super viewDidLoad];
    [self getData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_employees count];
}

-(void)getData{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [Networking getEmployees:^(NSArray<EmployeeModel *>* employees) {
            self.employees = employees;
        }];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EmployeeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell setEmployee:_employees[indexPath.row]];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    EmployeeViewController *vc = segue.destinationViewController;
    vc.employee = self.employees[[self.tableView indexPathForSelectedRow].row];
}


@end
