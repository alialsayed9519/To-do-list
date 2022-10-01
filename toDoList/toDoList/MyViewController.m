//
//  MyViewController.m
//  toDoList
//
//  Created by Ali on 05/04/2022.
//

#import "MyViewController.h"
#import "Task.h"

@interface MyViewController (){
    NSMutableArray<Task*> *myTasks;
    NSUserDefaults *def ;
    UserDefualts *userDefaults;
    
    BOOL isFilter;
    NSMutableArray<Task*>*filteredDevices;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    isFilter=NO;
    self.searchBar.delegate = self;
    
    def = [NSUserDefaults standardUserDefaults];
    myTasks = [NSMutableArray new];
    userDefaults = [UserDefualts new];
        
    myTasks = [[userDefaults readArrayWithCustomObjFromUserDefaults:@"myArray" withUserDefault:def] mutableCopy];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(isFilter){
        return filteredDevices.count;
    }else{
        return [myTasks count];

    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
      
    cell.textLabel.text = [[myTasks objectAtIndex:indexPath.row] name];
      
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailedViewController *details = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailedViewController"];
    
    [details setTask:myTasks[indexPath.row]];
   
    details.index = indexPath.row;
    details.flag = NO;
    
    [self.navigationController pushViewController:details animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"To Do";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
    
        [myTasks removeObjectAtIndex:indexPath.row];
                
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        myTasks = [[userDefaults readArrayWithCustomObjFromUserDefaults:@"myArray" withUserDefault:def] mutableCopy];
        [myTasks removeObjectAtIndex:indexPath.row];
        [userDefaults writeArrayWithCustomObjToUserDefaults:@"myArray" withArray:myTasks withUserDefault:def];
                
        [tableView reloadData];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

- (void)viewWillAppear:(BOOL)animated{
    
    myTasks = [[userDefaults readArrayWithCustomObjFromUserDefaults:@"myArray" withUserDefault:def] mutableCopy];
    
    [_tableView reloadData];
}

- (IBAction)add:(id)sender {
    
    ViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    [self.navigationController pushViewController:view animated:YES];
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    if (searchText.length == 0) {
        isFilter = NO;
    }
    else {
        isFilter = YES;
        filteredDevices = [[NSMutableArray alloc]init];
        for (int i=0; i<myTasks.count; i++) {
            if ([myTasks[i].name hasPrefix:searchText] || [myTasks[i].name hasPrefix:[searchText lowercaseString]]) {
                    [filteredDevices addObject:myTasks[i]];
            }
        }
    }
    [self.tableView reloadData];
}


@end
