//
//  DoneViewController.m
//  toDoList
//
//  Created by Ali on 07/04/2022.
//

#import "DoneViewController.h"
#import "Task.h"
#import "UserDefualts.h"

@interface DoneViewController ()
@property (weak, nonatomic) IBOutlet UITableView *DonetableView;

@end

@implementation DoneViewController{
    NSMutableArray *done;
    UserDefualts *userDefaults;
    NSUserDefaults *def ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _DonetableView.delegate = self;
    def = [NSUserDefaults standardUserDefaults];
    userDefaults = [UserDefualts new];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [done count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"doneCell" forIndexPath:indexPath];
    
   
    
   cell.textLabel.text = [[done objectAtIndex:indexPath.row] name];
      
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
    
        [done removeObjectAtIndex:indexPath.row];
                
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        done = [[userDefaults readArrayWithCustomObjFromUserDefaults:@"myDone" withUserDefault:def] mutableCopy];
        [done removeObjectAtIndex:indexPath.row];
        [userDefaults writeArrayWithCustomObjToUserDefaults:@"myDone" withArray:done withUserDefault:def];

        [tableView reloadData];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Done";
}
- (void)viewWillAppear:(BOOL)animated{
    done = [NSMutableArray new];
    done = [[userDefaults readArrayWithCustomObjFromUserDefaults:@"myDone" withUserDefault:def] mutableCopy];
    if(done == nil){
        done = [NSMutableArray new];
    }
    [_DonetableView reloadData];
}

@end
