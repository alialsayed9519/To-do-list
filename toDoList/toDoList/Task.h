//
//  Task.h
//  toDoList
//
//  Created by Ali on 06/04/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject

@property NSString *name;
@property NSString *descrip;
@property int priority;
@property NSDate *date;

@end

NS_ASSUME_NONNULL_END
