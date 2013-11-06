//
//  twgAddItemViewController.m
//  QuickCheck
//
//  Created by Nicholas Wade on 11/3/13.
//  Copyright (c) 2013 Nicholas Wade. All rights reserved.
//

#import "twgAddItemViewController.h"

@interface twgAddItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation twgAddItemViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    if (self.textField.text.length <= 0) return;
    self.itemToDo = [[twgListItem alloc] init];
    self.itemToDo.lItemName = self.textField.text;
    self.itemToDo.itCompleted = FALSE;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
