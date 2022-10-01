//
//  DetailedViewController.h
//  toDoList
//
//  Created by Ali on 06/04/2022.
//

#import "ViewController.h"
#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailedViewController : ViewController

@property Task *task;
@property long index;
@property bool flag;

@end

NS_ASSUME_NONNULL_END
