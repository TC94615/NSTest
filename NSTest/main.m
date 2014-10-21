//
//  main.m
//  NSTest
//
//  Created by 李道政 on 2014/10/21.
//  Copyright (c) 2014年 李道政. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        //NSNumber *numberObject1;
        //NSNumber *numberObject2;
        /*int userInput1 = 0, userInput2 = 0;
        scanf("%i",&userInput1);
        scanf("%i",&userInput2);
        int result = userInput1+userInput2;
        for(int i = 0 ; i < 3 ; i++){
            NSLog(@"%i",i);
        }*/
        /*int userInput;
        userInput = 0;
        scanf("%i",&userInput);
        numberObject1 = [NSNumber numberWithInt:userInput];
        NSLog(@"input = %@", numberObject1);
        scanf("%i",&userInput);
        numberObject2 = [NSNumber numberWithInt:userInput];
        NSLog(@"input = %@", numberObject2);
        int int1 = [numberObject1 intValue];
        int int2 = [numberObject2 intValue];
        int result = int1+int2;*/
        //NSLog(@"%i",result);
        char input1[40],input2[40];
        scanf("%s",input1);
        scanf("%s",input2);
        NSMutableString *ip1 = [NSString stringWithCString:input1 encoding:NSUTF8StringEncoding];
        NSMutableString *ip2 = [NSString stringWithCString:input2 encoding:NSUTF8StringEncoding];
        //NSLog(@"%i,%i",ip1.length,ip2.length);
        //NSString *mystring = @"This is a test message having more than 20 characters";
        //NSString *newString = [mystring substringWithRange:NSMakeRange(10, 20)];
        //NSLog(@"%@", newString);
        int int1 = [ip1 intValue],int2 = [ip2 intValue];
        NSLog(@"%i,%i",int1,int2);
        int blocksize = 8; //Big number divided by 8 bits
        NSMutableArray *array1 = [NSMutableArray array];
        NSMutableArray *array2 = [NSMutableArray array];
        NSMutableArray *array3 = [NSMutableArray array];
        int intbuffer;
        NSMutableString *buffer = [NSMutableString string];
        if([ip1 length] < [ip2 length]){
            int sub = [ip2 length] - [ip1 length];
            NSLog(@"%i,%i,%i",sub,[ip1 length],[ip2 length]);
            for(int i = 0; i < sub ; i++){
                [buffer appendString:@"0"];
            }
            [buffer appendString:ip1];
            ip1 = buffer;
            NSLog(@"%@\n%@",ip1,ip2);
        }
        if([ip1 length]>[ip2 length]){
            int sub = [ip1 length] - [ip2 length];
            NSLog(@"%i,%i,%i",sub,[ip1 length],[ip2 length]);
            for(int i = 0; i < sub ; i++){
                [buffer appendString:@"0"];
            }
            [buffer appendString:ip2];
            ip2 = buffer;
            NSLog(@"%@\n%@",ip1,ip2);
        }
        int strlen = [ip1 length];
        int blockcount = strlen/blocksize+1;
        for(int i=1;i<blockcount;i++){
            buffer = [ip1 substringWithRange:NSMakeRange(strlen-blocksize*i,blocksize)];
            intbuffer = [buffer intValue];
            NSLog(@"%i",intbuffer);
            [array1 addObject:[NSNumber numberWithInt: intbuffer]];
            
            buffer = [ip2 substringWithRange:NSMakeRange(strlen-blocksize*i,blocksize)];
            intbuffer = [buffer intValue];
            NSLog(@"%i",intbuffer);
            [array2 addObject:[NSNumber numberWithInt: intbuffer]];
        }
        buffer = [ip1 substringWithRange:NSMakeRange(0,strlen%blocksize)];
        intbuffer = [buffer intValue];
        NSLog(@"%i",intbuffer);
        [array1 addObject:[NSNumber numberWithInt: intbuffer]];
            
        buffer = [ip2 substringWithRange:NSMakeRange(0,strlen%blocksize)];
        intbuffer = [buffer intValue];
        NSLog(@"%i",intbuffer);
        [array2 addObject:[NSNumber numberWithInt: intbuffer]];
            
        int carry = 0;
        for(int i=0;i<[array1 count];i++){
            intbuffer = [array1[i] intValue] + [array2[i] intValue] + carry;
            if (intbuffer > 99999999){
                carry = 1;
                intbuffer = intbuffer - 100000000;
            }
            [array3 addObject:[NSNumber numberWithInt:intbuffer]];
            NSLog(@"%i",intbuffer);
        }
        //NSLog(@"%@",[array3 reverseObjectEnumerator]);
        array3 = [[array3 reverseObjectEnumerator] allObjects];
        NSString *output = [array3 componentsJoinedByString:@","];
        NSLog(@"result is %@", output);
        
    }
    return 0;
}
