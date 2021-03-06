//
//  CSSecondTableViewController.m
//  ControlSystems
//
//  Created by Andrey on 19.02.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "CSSecondTableViewController.h"
#import "CSPersonsLibrary.h"

@interface CSSecondTableViewController ()

@end

@implementation CSSecondTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // наблюдатель слушает нужно ли обновить таблицу
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableViewData) name:@"ReloadTableFromAppDelegate" object:nil];
}

- (void)reloadTableViewData{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"SecondCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    CSPersonsLibrary *personsLibrary = [CSPersonsLibrary sharedInstance];
    NSArray *persons = [personsLibrary persons];
    
    NSString *str = [NSString stringWithFormat:@"%@, %@", [[persons objectAtIndex: indexPath.row] personName], [[persons objectAtIndex: indexPath.row] personCountry]];
    cell.textLabel.text = str;

    return cell;
}


@end
