//
//  HallOfShameTableViewController.m
//  ShameOnYou
//
//  Created by Erica Correa on 5/20/16.
//  Copyright © 2016 Will Devon-sand. All rights reserved.
//

#import "HallOfShameTableViewController.h"
#import "MyTableViewCell.h"
#import "ShameeViewController.h"

@interface HallOfShameTableViewController ()

@property (nonatomic, strong) NSString *shame;

@end

@implementation HallOfShameTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[MyTableViewCell class]forCellReuseIdentifier:@"Cell"];
    
    self.dao = [DAO sharedInstance];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tableViewLoad) name:@"Reload" object:nil];
}

- (void)tableViewLoad {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dao.arrayOfNames count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * CellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [self.dao.arrayOfNames objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    ShameeViewController * shameeVC = [[ShameeViewController alloc]init];
    self.shame = [self.dao.arrayOfNames objectAtIndex:[indexPath row]];
    NSLog(@"%@",self.shame);
    
    [self performSegueWithIdentifier:@"lastSegue" sender:self.shame];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"lastSegue"]) {
        ShameeViewController * shameeVC = (ShameeViewController *) segue.destinationViewController;
        shameeVC.shamee = self.shame;
        NSLog(@"%@",self.shame);
    }
}

@end
