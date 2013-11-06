//
//  twgTableViewController.m
//  QuickCheck
//
//  Created by Nicholas Wade on 11/3/13.
//  Copyright (c) 2013 Nicholas Wade. All rights reserved.
//

#import "twgTableViewController.h"
#import "twgAddItemViewController.h"
#import "twgListItem.h"

@interface twgTableViewController ()
@property NSMutableArray *todoList;
@end

@implementation twgTableViewController

- (IBAction)unwindtoList:(UIStoryboardSegue *)segue
{
    twgAddItemViewController *sourceView = [segue sourceViewController];
    twgListItem *listItem = sourceView.itemToDo;
    if(listItem == nil) return;
    [self.todoList addObject:listItem];
    [self.tableView reloadData];
}

- (void)initToDoList
{
    // Init our todo list items
    twgListItem *item1 = [[twgListItem alloc] init];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.todoList = [[NSMutableArray alloc] init];
    [self initToDoList];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.todoList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    twgListItem *toDoItem = [self.todoList objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.lItemName;
    if(toDoItem.itCompleted)
    {
        NSDictionary* attributes = @{NSStrikethroughStyleAttributeName:
                                         [NSNumber numberWithInt:NSUnderlineStyleSingle]};
        
        NSAttributedString* attrText = [[NSAttributedString alloc] initWithString:cell.textLabel.text attributes:attributes];
        
        cell.textLabel.attributedText = attrText;
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    twgListItem *selItem = [self.todoList objectAtIndex:indexPath.row];
    selItem.itCompleted = !selItem.itCompleted;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
