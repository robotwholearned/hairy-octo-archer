//
//  Bob.m
//  Bob
//
//  Created by Sandquist, Cassandra G on 9/23/14.
//  Copyright (c) 2014 robotwholearned. All rights reserved.
//

//# Bob
//
//Bob is a lackadaisical teenager. In conversation, his responses are very limited.
//
//Bob answers 'Sure.' if you ask him a question.
//
//He answers 'Whoa, chill out!' if you yell at him.
//
//He says 'Fine. Be that way!' if you address him without actually saying
//anything.
//
//He answers 'Whatever.' to anything else.

#import "Bob.h"

@interface Bob()

@property BOOL isShouting;
@property BOOL isQuestion;
@property BOOL isEmpty;

@end

typedef enum {
    question,
    shout,
    wevs,
    silence
    
}Response;

@implementation Bob

-(instancetype) init{
    if (self = [super init]) {
        self.isQuestion = NO;
        self.isShouting = NO;
        self.isEmpty = YES;
    }
    return self;
}

-(NSString *) hey: (NSString *) input{

    Response responds = wevs;
    
    self.isShouting = [self isThisShouting:input];
    self.isQuestion = [self isThisAQuestion:input];
    self.isEmpty = [self isThisSilence: input];

    if (self.isShouting && self.isQuestion) {
        responds = question;
    }
    if (self.isQuestion) {
        responds = question;
    }
    if (self.isShouting) {
        responds = shout;
    }
    if (self.isEmpty) {
        responds = silence;
    }
    
    return [self convertToString:responds];
}
-(BOOL) isThisAQuestion: (NSString *) input{
    if ([input hasSuffix:@"?"]) {
        return YES;
    }
    return NO;
}
-(BOOL) isThisShouting: (NSString *) input{

    NSCharacterSet *lowerCaseCharacterSet = [NSCharacterSet lowercaseLetterCharacterSet];
    NSCharacterSet *upperCaseSet = [NSCharacterSet uppercaseLetterCharacterSet];
    
    if ([input rangeOfCharacterFromSet:lowerCaseCharacterSet].location == NSNotFound) {
        if ([input rangeOfCharacterFromSet:upperCaseSet].location == NSNotFound) {
            return NO;
        }
        return YES;
    }

    return NO;
}

-(BOOL) isThisSilence: (NSString *) input{
    NSString *cleaned = [input stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([cleaned isEqualToString:@""]) {
        return YES;
    }
    
    return NO;
}

- (NSString*) convertToString:(Response) whichResponse {
    NSString *result = nil;
    
    switch(whichResponse) {
        case question:
            result = @"Sure.";
            break;
        case shout:
            result = @"Woah, chill out!";
            break;
        case wevs:
            result = @"Whatever.";
            break;
        case silence:
            result = @"Fine, be that way.";
            break;
        default:
            result = @"unknown - how did this happen?";
    }
    
    return result;
}

@end
