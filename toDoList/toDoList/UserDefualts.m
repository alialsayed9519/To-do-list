//
//  UserDefualts.m
//  toDoList
//
//  Created by Ali on 06/04/2022.
//

#import "UserDefualts.h"

@implementation UserDefualts

-(void)writeArrayWithCustomObjToUserDefaults:(NSString *)keyName withArray:(NSMutableArray *)myArray withUserDefault:(  NSUserDefaults *)def
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:myArray];
    [def setObject:data forKey:keyName];
    [def synchronize];
}

-(NSArray *)readArrayWithCustomObjFromUserDefaults:(NSString *)keyName withUserDefault:(  NSUserDefaults *)def
{
    NSData *data = [def objectForKey:keyName];
    NSArray *myArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return myArray;
}
@end
