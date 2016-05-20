//
//  HallOfShameTableViewController.m
//  ShameOnYou
//
//  Created by Erica Correa on 5/20/16.
//  Copyright © 2016 Will Devon-sand. All rights reserved.
//

#import "HallOfShameTableViewController.h"
#import "MyTableViewCell.h"

@interface HallOfShameTableViewController ()

@end

@implementation HallOfShameTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView registerClass:[MyTableViewCell class]forCellReuseIdentifier:@"Cell"];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//change later to make dynamic
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//change later to make dynamic
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


//didSelectRowAtIndexPath method needed

@end
