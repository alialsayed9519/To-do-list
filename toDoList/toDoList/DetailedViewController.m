//
//  DetailedViewController.m
//  toDoList
//
//  Created by Ali on 06/04/2022.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTf;
@property (weak, nonatomic) IBOutlet UITextField *priorityTf;
@property (weak, nonatomic) IBOutlet UIDatePicker *dateP;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIButton *addToProgress;
@property (weak, nonatomic) IBOutlet UIButton *addToDone;
@property (weak, nonatomic) IBOutlet UIButton *addToDoneFromProgress;


@end

@implementation DetailedViewController{
    NSMutableArray<Task*> *tasks;
    NSMutableArray<Task*> *progress;
    NSMutableArray<Task*> *done;
    UserDefualts *userDefaults;
    NSUserDefaults *def ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if(self.flag == YES){
        _saveBtn.hidden = YES;
        _addToProgress.hidden = YES;
        _addToDone.hidden = YES;
    }
    
    if(self.flag == NO){
        _addToDoneFromProgress.hidden = YES;
    }
    
    def = [NSUserDefaults standardUserDefaults];
    tasks = [NSMutableArray new];
    progress = [NSMutableArray new];
    done = [NSMutableArray new];
    userDefaults = [UserDefualts new];
    
    _nameTf.text = _task.name;
    _descriptionTf.text = _task.descrip;
    _priorityTf.text = @(_task.priority).stringValue;
 //   _dateP = _task.date;
}
- (IBAction)save:(id)sender {
    Task *myTask = [Task new];
    myTask.name = _nameTf.text;
    myTask.descrip = _descriptionTf.text;
    myTask.priority =( _priorityTf.text).intValue;
    myTask.date = [NSDateFormatter localizedStringFromDate:[_dateP date] dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
    
    
    [self.dateP addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];

    tasks = [[userDefaults readArrayWithCustomObjFromUserDefaults:@"myArray" withUserDefault:def] mutableCopy];
    [tasks replaceObjectAtIndex:_index withObject:myTask];
    [userDefaults writeArrayWithCustomObjToUserDefaults:@"myArray" withArray:tasks withUserDefault:def];
    
    
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)addToProgress:(id)sender {
    Task *myTask = [Task new];
    myTask.name = _nameTf.text;
    myTask.descrip = _descriptionTf.text;
    myTask.priority =( _priorityTf.text).intValue;
   // myTask.date = _dateP.date;
    
    progress = [[userDefaults readArrayWithCustomObjFromUserDefaults:@"myProgress" withUserDefault:def] mutableCopy];
   
    if(progress == nil){
        progress = [NSMutableArray new];
    }
    
    [progress addObject:myTask];
    
    [userDefaults writeArrayWithCustomObjToUserDefaults:@"myProgress" withArray:progress withUserDefault:def];
    
    tasks = [[userDefaults readArrayWithCustomObjFromUserDefaults:@"myArray" withUserDefault:def] mutableCopy];
   
    [tasks removeObjectAtIndex:_index];
   
    [userDefaults writeArrayWithCustomObjToUserDefaults:@"myArray" withArray:tasks withUserDefault:def];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)addToDone:(id)sender {
    Task *myTask = [Task new];
    myTask.name = _nameTf.text;
    myTask.descrip = _descriptionTf.text;
    myTask.priority =( _priorityTf.text).intValue;
   // myTask.date = _dateP.date;
    
    done = [[userDefaults readArrayWithCustomObjFromUserDefaults:@"myDone" withUserDefault:def] mutableCopy];
    
    if(done == nil){
        done = [NSMutableArray new];
    }
    
    [done addObject:myTask];
    
    [userDefaults writeArrayWithCustomObjToUserDefaults:@"myDone" withArray:done withUserDefault:def];
    
    tasks = [[userDefaults readArrayWithCustomObjFromUserDefaults:@"myArray" withUserDefault:def] mutableCopy];
   
    [tasks removeObjectAtIndex:_index];
   
    [userDefaults writeArrayWithCustomObjToUserDefaults:@"myArray" withArray:tasks withUserDefault:def];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (IBAction)addTaskToDoneFormDoing:(id)sender {
    
    Task *myTask = [Task new];
    myTask.name = _nameTf.text;
    myTask.descrip = _descriptionTf.text;
    myTask.priority =( _priorityTf.text).intValue;
   // myTask.date = _dateP.date;
    
    done = [[userDefaults readArrayWithCustomObjFromUserDefaults:@"myDone" withUserDefault:def] mutableCopy];
    
    if(done == nil){
        done = [NSMutableArray new];
    }
    
    [done addObject:myTask];
    
    [userDefaults writeArrayWithCustomObjToUserDefaults:@"myDone" withArray:done withUserDefault:def];
    
    progress = [[userDefaults readArrayWithCustomObjFromUserDefaults:@"myProgress" withUserDefault:def] mutableCopy];
   
    [progress removeObjectAtIndex:_index];
   
    [userDefaults writeArrayWithCustomObjToUserDefaults:@"myProgress" withArray:progress withUserDefault:def];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

@end
