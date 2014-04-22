//
//  HashaAppDelegate.m
//  OpenHasha
//
//  Copyright (c) 2014 Cai, Zhi-Wei. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

#import "OpenHashaAppDelegate.h"

@implementation OpenHashaAppDelegate

@synthesize window, inText, outText;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [[self window] setLevel:NSFloatingWindowLevel];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    
    return YES;
}

-(IBAction)go:(id)sender {
    
    NSString *inStr = [[inText stringValue] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSMutableArray  *inArray    = [NSMutableArray new];
    NSMutableArray  *inCopy     = [NSMutableArray new];
    NSArray         *outCopy    = [NSArray new];
    
    for (NSInteger i = 0; i< inStr.length; i++) {
        [inArray addObject:[NSString stringWithFormat:@"%C", [inStr characterAtIndex:i]]];
    }
    
    for (id obj in [inArray objectEnumerator]) {
        if (![obj isEqualTo:@" "] && ![obj isEqualTo:@"\n"] && ![obj isEqualTo:@"\r"] && ![obj isEqualTo:@"\t"] && [inCopy indexOfObject:obj] == NSNotFound) {
            [inCopy addObject:obj];
        }
    }
    
    outCopy = [inCopy sortedArrayUsingComparator:^NSComparisonResult(NSString *a, NSString *b) {
        return [a compare:b];
    }];
    
    [outText setStringValue:[NSString stringWithFormat:@"%@\n\nObjects: %li",
                             [[outCopy valueForKey:@"description"] componentsJoinedByString:@""],
                             (unsigned long)[outCopy count]]];
}

-(IBAction)clean:(id)sender {
    
    [inText setStringValue:@""];
    [outText setStringValue:@""];
}

@end
