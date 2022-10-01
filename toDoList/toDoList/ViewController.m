//
//  ViewController.m
//  toDoList
//
//  Created by Ali on 05/04/2022.
//

#import "ViewController.h"
#import "Task.h"

@interface ViewController (){
    NSUserDefaults *def ;
}

@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UITextField *priorityTf;
@property (weak, nonatomic) IBOutlet UIDatePicker *date;
@property (weak, nonatomic) IBOutlet UITextField *desc;



@end

@implementation ViewController{
    NSMutableArray<Task*> *tasks;
    UserDefualts *userDefaults;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    def = [NSUserDefaults standardUserDefaults];
    tasks = [NSMutableArray new];
    userDefaults = [UserDefualts new];
}

- (IBAction)add:(id)sender {
    Task *myTask = [Task new];
    
    myTask.name = _nameTf.text;
    myTask.descrip = _desc.text;
    myTask.priority =( _priorityTf.text).intValue;
    myTask.date = [NSDateFormatter localizedStringFromDate:[_date date] dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
    
    tasks = [[userDefaults readArrayWithCustomObjFromUserDefaults:@"myArray" withUserDefault:def] mutableCopy];
    
    if(tasks == nil){
        tasks = [NSMutableArray new];
    }
    
    [tasks addObject:myTask];
    
    [userDefaults writeArrayWithCustomObjToUserDefaults:@"myArray" withArray:tasks withUserDefault:def];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}



@end
