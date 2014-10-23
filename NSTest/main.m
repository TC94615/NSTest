//
//  main.m
//  NSTest
//
//  Created by 李道政 on 2014/10/21.
//  Copyright (c) 2014年 李道政. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface SampleClass: NSObject
+ (NSString*) getstdin;
+ (NSString*) fillZero : (NSString*) shorterString andGap : (int) sub;
+ (NSMutableArray*) stringSplitToArrayByLength : (NSString*) string andLength : (int) length;
+ (NSMutableArray*) arrayAdd : (NSMutableArray*) array1 andArray : (NSMutableArray*) array2;
@end
@implementation SampleClass
+ (NSString*) getstdin{
    NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
    NSData *inputData = [input availableData];
    NSString *inputString = [[NSString alloc] initWithData: inputData encoding:NSUTF8StringEncoding];
    //NSLog(@"input show in string: \n%s",[inputString UTF8String]);
    inputString = [inputString stringByTrimmingCharactersInSet: [NSCharacterSet newlineCharacterSet]];
    //NSLog(@"input show in integer: \n%i",[inputString intValue]);
    return inputString;
}
+ (NSString*) fillZero : (NSString*) shorterString andGap : (int) sub{
    //NSLog(@"in fillzero");
    NSMutableString* buffer = [NSMutableString string];
    for(int i = 0; i < sub ; i++){
        [buffer appendString:@"0"];
    }
    [buffer appendString:shorterString];
    shorterString = buffer;
    //NSLog(@"fillzero down");
    return shorterString;
}
+ (NSMutableArray*) stringSplitToArrayByLength : (NSString*) string andLength : (int) blocksize{
    int strlen = (int)[string length];
    int blockcount = strlen/blocksize+1;
    int intbuffer;
    NSMutableArray *stringArrayByLength = [NSMutableArray array];
    NSMutableString *buffer = [NSMutableString string];
    for(int i=1;i<blockcount;i++){
        buffer = [string substringWithRange:NSMakeRange(strlen-blocksize*i,blocksize)];
        intbuffer = [buffer intValue];
        //NSLog(@"%i",intbuffer);
        [stringArrayByLength addObject:[NSNumber numberWithInt: intbuffer]];
    }
    buffer = [string substringWithRange:NSMakeRange(0,strlen%blocksize)];
    intbuffer = [buffer intValue];
    //NSLog(@"%i",intbuffer);
    [stringArrayByLength addObject:[NSNumber numberWithInt: intbuffer]];
    return stringArrayByLength;
}
+ (NSMutableArray*) arrayAdd : (NSMutableArray*) array1 andArray : (NSMutableArray*) array2{
    NSMutableArray* resultArray = [NSMutableArray array];
    int intbuffer = 0;
    int carry = 0;
    for(int i=0;i<[array1 count]-1;i++){
        intbuffer = [array1[i] intValue] + [array2[i] intValue] + carry;
        carry = 0;
        if (intbuffer > 99999999){
            carry = 1;
            intbuffer = intbuffer - 100000000;
        }
        [resultArray addObject:[NSNumber numberWithInt:intbuffer]];
        //NSLog(@"%i",intbuffer);
    }
    intbuffer = [array1[[array1 count]-1] intValue] + [array2[[array1 count]-1] intValue] + carry;
    if(intbuffer!=0){
        [resultArray addObject:[NSNumber numberWithInt:intbuffer]];
    }
    //NSLog(@"%@",[array3 reverseObjectEnumerator]);
    resultArray = [[resultArray reverseObjectEnumerator] allObjects];
    return resultArray;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");

        NSString *ip1 = [SampleClass getstdin];
        NSString *ip2 = [SampleClass getstdin];
        //read 2 big numbers as string from user input

        int blocksize = 8;
        //Big number divided by 8 bits to array elements
        
        NSMutableArray *array1 = [NSMutableArray array];
        NSMutableArray *array2 = [NSMutableArray array];
        NSMutableArray *array3 = [NSMutableArray array];
        //In below computing, array3 := array1 + array2
        
        if([ip1 length] < [ip2 length]){
            int sub = (int)([ip2 length] - [ip1 length]);
            //NSLog(@"%i,%lu,%lu",sub,[ip1 length],[ip2 length]);
            ip1 = [SampleClass fillZero:ip1 andGap:sub];           
        }
        if([ip1 length]>[ip2 length]){
            int sub = (int)([ip1 length] - [ip2 length]);
            //NSLog(@"%i,%lu,%lu",sub,[ip1 length],[ip2 length]);
            ip2 = [SampleClass fillZero:ip2 andGap:sub];
            
        }
        //Alignment, fill zeros to the shorter string, and the two string will have same length
        NSLog(@"\n %@\n+%@",ip1,ip2);
        //Show the 2 numbers after alignment
        array1 = [SampleClass stringSplitToArrayByLength:ip1 andLength:blocksize];
        array2 = [SampleClass stringSplitToArrayByLength:ip2 andLength:blocksize];
        //Split strings by 8 chararcters to array elements
        
        array3 = [SampleClass arrayAdd:array1 andArray:array2];
        //Add two arrays by elements
        NSString *output = [array3 componentsJoinedByString:@""];
        NSLog(@"\n=%@", output);
        //Show result
        
    }
    return 0;
}
