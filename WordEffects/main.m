//
//  main.m
//  WordEffects
//
//  Created by asu on 2015-08-24.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString* getLastChar(NSString* inputString){
    return [inputString substringFromIndex:[inputString length] - 1];
}



NSString* getInput(NSString* prompt){
    // 255 unit long array of characters
    char inputChars[255];
    char promptChars[255];
    [prompt getCString:promptChars maxLength:255 encoding:NSUTF8StringEncoding];
    
    printf("%s",promptChars);
    // limit input to max 255 characters
    fgets(inputChars, 255, stdin);
    
    // convert char array to an NSString object
    NSString *inputString = [NSString stringWithUTF8String:inputChars] ;
    
    // remove newline
    inputString = [inputString substringToIndex:[inputString length] - 1 ];

    return inputString;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        while (YES){
        
            NSString *numberString = getInput(@"Enter a number: ");
            int commandNumber = 0;
            
            while(commandNumber == 0){
                if ([numberString isEqualToString:@"1"] ||
                    [numberString isEqualToString:@"2"] ||
                    [numberString isEqualToString:@"3"] ||
                    [numberString isEqualToString:@"4"] ||
                    [numberString isEqualToString:@"5"] ||
                    [numberString isEqualToString:@"6"] ) {
                    
                    commandNumber = [numberString intValue];
                    
                }
                else {
                    NSLog(@"Exiting.  Thanks for playing.");
                    return 0;
                }
            }
            
            NSString *inputString = getInput(@"Enter a string: ");
            
            
            switch(commandNumber){
                case 1:
                    // Uppercase
                    NSLog(@"%@", [inputString uppercaseString]);
                    break;
                case 2:
                    // Lowercase
                    NSLog(@"%@", [inputString lowercaseString]);
                    break;
                case 3:
                    // Numberize
	                {
    	            	float numericValue = [inputString floatValue];
                        NSLog(@"The number is %f", numericValue);
                    }
                    break;
                case 4:
                    // Canadianize
                    NSLog(@"%@, eh?", inputString);
                    break;
                case 5:
                    // Respond
	                {
                        NSString *lastChar = getLastChar(inputString);
                        NSLog(@"Last Char: %@", lastChar);
                        
                        if ([lastChar isEqualToString:@"?"]){
                        	NSLog(@"I don't know");
                        }
                        else if ([lastChar isEqualToString:@"!"]){
                            NSLog(@"Whoa, calm down!");
                        }
						else {
                            NSLog(@"...");
                        }
                	}
                	break;
                case 6:
                    // De-space
                    NSLog(@"%@",[inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
                    break;
            }
            
        }
        
        
        
    }
    return 0;
}
