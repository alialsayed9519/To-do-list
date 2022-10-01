//
//  UserDefualts.h
//  toDoList
//
//  Created by Ali on 06/04/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserDefualts : NSObject

-(void)writeArrayWithCustomObjToUserDefaults:(NSString *)keyName withArray:(NSMutableArray *)myArray withUserDefault:(  NSUserDefaults *)def;
-(NSArray *)readArrayWithCustomObjFromUserDefaults:(NSString *)keyName withUserDefault:(  NSUserDefaults *)def;


@end

NS_ASSUME_NONNULL_END
