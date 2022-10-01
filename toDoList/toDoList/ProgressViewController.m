//
//  ProgressViewController.m
//  toDoList
//
//  Created by Ali on 07/04/2022.
//

#import "ProgressViewController.h"
#import "Task.h"
#import "UserDefualts.h"
#import "DetailedViewController.h"

@interface ProgressViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableViewProgress;

@end

@implementation ProgressViewController{
    NSMutableArray *progress;
    UserDefualts *userDefaults;
    NSUserDefaults *def ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    _tableViewProgress.delegate = self;
    def = [NSUserDefaults standardUserDefaults];
    userDefaults = [UserDefualts new];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [progress count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"progressCell" forIndexPath:indexPath];
        
   cell.textLabel.text = [[progress objectAtIndex:indexPath.row] name];
      
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailedViewController *details = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailedViewController"];
    
    [details setTask:progress[indexPath.row]];
   
    details.index = indexPath.row;
    details.flag = YES;
    
    [self.navigationController pushViewController:details animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
    
        [progress removeObjectAtIndex:indexPath.row];
                
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        progress = [[userDefaults readArrayWithCustomObjFromUserDefaults:@"myProgress" withUserDefault:def] mutableCopy];
        [progress removeObjectAtIndex:indexPath.row];
        [userDefaults writeArrayWithCustomObjToUserDefaults:@"myProgress" withArray:progress withUserDefault:def];
        
        [tableView reloadData];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Doing";
}

- (void)viewWillAppear:(BOOL)animated{
    progress = [NSMutableArray new];
    progress = [[userDefaults readArrayWithCustomObjFromUserDefaults:@"myProgress" withUserDefault:def] mutableCopy];
    if(progress == nil){
        progress = [NSMutableArray new];
    }
    [_tableViewProgress reloadData];
}

@end
