//
//  VCUserList.m
//  ACSocial
//
//  Created by Alexandre Santos on 26/08/15.
//  Copyright (c) 2015 Avenue Code. All rights reserved.
//

#import "VCUserList.h"
#import "UserCell.h"

static NSString * const CellID = @"UserCell";

@interface VCUserList ()

@property (nonatomic) NSArray *userNames;

@end

@implementation VCUserList

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"All Users";
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([UserCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CellID];
    
    self.userNames = @[@"Alexandre", @"Felipe", @"Marcelo", @"Eduardo", @"Tiago", @"Thiago", @"João"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.userNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    
    // TODO: Setup UserCell properly.
    cell.nameLabel.text = self.userNames[indexPath.row];

    // Clear target and add it again
    [cell.addFriendButton removeTarget:self action:NULL forControlEvents:UIControlEventTouchUpInside];
    [cell.addFriendButton addTarget:self action:@selector(addFriendButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

#pragma mark - UI Actions

- (IBAction)doneButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addFriendButtonTapped:(id)sender {
    NSLog(@"Add Friend tapped!");
    
    if([self.delegate respondsToSelector:@selector(vcUserList:didAddFriend:)]) {
        // TODO: Proper implement
        ACUser *addedFriend = [[ACUser alloc] initWithDictionary:@{@"name":self.userNames[0]}];
        [self.delegate vcUserList:self didAddFriend:addedFriend];
    }
}

@end
