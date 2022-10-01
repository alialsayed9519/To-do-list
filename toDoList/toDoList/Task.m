//
//  Task.m
//  toDoList
//
//  Created by Ali on 06/04/2022.
//

#import "Task.h"

@implementation Task


- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:_name forKey:@"name"];
    [coder encodeObject:_descrip forKey:@"description"];
    [coder encodeInt:_priority forKey:@"priority"];
    [coder encodeObject:_date forKey:@"date"];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    
    if (self) {
       _name = [coder decodeObjectForKey:@"name"];
        _descrip = [coder decodeObjectForKey:@"description"];
        _priority = [coder decodeIntForKey:@"priority"];
        _date = [coder decodeObjectForKey:@"date"];
    }
    return self;
}


@end
