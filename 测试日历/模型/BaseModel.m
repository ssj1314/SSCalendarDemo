//
//  BaseModel.m
//  HTF_New
//
//  Created by Revival_Road on 16/8/26.
//  Copyright © 2016年 htffund. All rights reserved.
//

#import "BaseModel.h"
#import <objc/runtime.h>
@implementation BaseModel
-(instancetype)modelWithDictionary:(NSDictionary *)jsonDictionary
{
    BaseModel *model =[BaseModel new];
    
    if (self)
    {
        if (VALIDDICTIONARY(jsonDictionary))
        {
            unsigned int count =0;
            
            objc_property_t *properties =class_copyPropertyList([model class], &count);
            for (int i =0; i < count; i ++)
            {
                objc_property_t property =properties[i];
                const char *name =property_getName(property);
                NSString *key =[NSString   stringWithUTF8String:name];
                
                [model setValue:jsonDictionary[key]?jsonDictionary[key]:@"" forKey:key];
            }
        }
    }
    
    return model;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count =0;
    
    objc_property_t *properties =class_copyPropertyList([self class], &count);
    for (int i =0; i < count; i ++)
    {
        objc_property_t property =properties[i];
        const char *name =property_getName(property);
        NSString *key =[NSString   stringWithUTF8String:name];
        
        [aCoder encodeObject:[self valueForKeyPath:key]?[self valueForKeyPath:key]:@"" forKey:key];
    }
    
    //释放属性
    free(properties);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self =[super init];
    
    if (self)
    {
        unsigned int count =0;
        objc_property_t *properties =class_copyPropertyList([self class], &count);
        for (int i =0; i < count; i ++)
        {
            objc_property_t property =properties[i];
            const char *name =property_getName(property);
            NSString *key =[NSString stringWithUTF8String:name];
            
            [self setValue:[aDecoder decodeObjectForKey:key]?[aDecoder decodeObjectForKey:key]:@"" forKeyPath:key];
        }
        
        //释放属性
        free(properties);
    }
    
    return self;
}
//浅复制拷贝
- (instancetype)copyWithZone:(NSZone *)zone
{
    id  copy =[[[self class] allocWithZone:zone] init];
    
    unsigned int count =0;
    objc_property_t *properties =class_copyPropertyList([self class], &count);
    for (int i =0; i < count; i ++)
    {
        objc_property_t property =properties[i];
        const char *name =property_getName(property);
        NSString *key =[NSString stringWithUTF8String:name];
        [copy setValue:[self valueForKeyPath:key]?[self valueForKeyPath:key]:@"" forKeyPath:key];
    }
    
    //释放属性
    free(properties);
    return copy;
}


//+(void)saveData:(NSMutableArray *)data
//{
//    if (VALIDARRAY(data))
//    {
//        NSMutableArray *dataArray =[NSMutableArray array];
//        
//        for (int i=0; i<data.count; i++)
//        {
//            if ([data[i] isKindOfClass:[self class]])
//            {
//                NSData *aData = [NSKeyedArchiver archivedDataWithRootObject:(BaseModel *)data[i]];
//                [dataArray AX_addObject:aData];
//            }
//        }
//        
//        USER_DEFAULTS_SAVE(NSStringFromClass(self.class), dataArray);
//    }
//}

//+(NSMutableArray *)readCachData
//{
//    NSMutableArray *resultArray =[NSMutableArray array];
//
//    if (VALIDARRAY(USER_DEFAULTS_VALUE_FOR_KEY(NSStringFromClass(self.class))))
//    {
//        NSArray *bankCardDataArray =USER_DEFAULTS_VALUE_FOR_KEY(NSStringFromClass(self.class));
//
//        for (int i=0; i<bankCardDataArray.count; i++)
//        {
//            id object =[NSKeyedUnarchiver unarchiveObjectWithData:[bankCardDataArray AX_objectAtIndex:i]];
//            [resultArray AX_addObject:object];
//        }
//    }
//
//    return resultArray;
//}
//
//+(void)clearCachData
//{
//    USER_DEFAULTS_REMOVE_OBJECT_FOR_KEY(NSStringFromClass(self.class));
//}
@end
