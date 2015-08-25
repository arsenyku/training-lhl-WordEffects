//
//  main.m
//  WordEffects
//
//  Created by asu on 2015-08-24.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import <Foundation/Foundation.h>


// getLastChar
// Extract the last character of a string.
//
NSString* getLastChar(NSString* inputString){
    if ([inputString length] < 1)
        return @"";
    
    return [inputString substringFromIndex:[inputString length] - 1];
}

// getInput
// Issue a prompt to the user and return the typed input
//
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

// Respond
// If the user posts a question or exclamation, display an appropriate response.
//
void Respond(NSString *inputString){
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

// Numberize
// Determine if the input is numeric, and print the result of converting
// it from a string to a number.
void Numberize(NSString *inputString){
    
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    NSNumber *convertedNumber = [numberFormatter numberFromString:inputString];
    if (convertedNumber == nil){
        NSLog(@"The provided input is not a number.");
    }else {
        NSLog(@"The number is %@", convertedNumber);
    }
    
}

// showIntroMessage
// Display a message to tell the user what to do.
//
void showIntroMessage(){
    NSLog(@"Enter a command, then a string.");
    NSLog(@"Valid commands are:");
    NSLog(@"1 - Uppercase");
    NSLog(@"2 - Lowercase");
    NSLog(@"3 - Numberize");
    NSLog(@"4 - Canadianize");
    NSLog(@"5 - Respond");
    NSLog(@"6 - De-space");
    NSLog(@"");
    NSLog(@"Any other command will exit.");
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        showIntroMessage();
        
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
                    Numberize(inputString);
                    break;
                case 4:
                    // Canadianize
                    NSLog(@"%@, eh?", inputString);
                    break;
                case 5:
                    // Respond
                    Respond(inputString);
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
