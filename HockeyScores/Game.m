//
//  Game.m
//  HockeyScores
//
//  Created by Jason Leyrer on 11/19/13.
//  Copyright (c) 2013 Jason Leyrer. All rights reserved.
//

#import "Game.h"

@implementation Game

- (id)initWithGameData:(NSDictionary *)gameData
{
    if (self = [super init]) {
        
        if ([[gameData objectForKey:@"event"] isEqualToString:@"NHL"]) {
        
            self.awayScore = [gameData objectForKey:@"awayScore"];
            self.awayTeam = [gameData objectForKey:@"awayTeam"];
            self.awayTeamCity = [gameData objectForKey:@"awayTeamCity"];
            self.awayTeamName = [gameData objectForKey:@"awayTeamName"];
            self.event = [gameData objectForKey:@"event"];
            self.homeScore = [gameData objectForKey:@"homeScore"];
            self.homeTeam = [gameData objectForKey:@"homeTeam"];
            self.homeTeamCity = [gameData objectForKey:@"homeTeamCity"];
            self.homeTeamName = [gameData objectForKey:@"homeTeamName"];
            self.isPlaying = (BOOL)[gameData objectForKey:@"isPlaying"];
            
            /*  NSDateFormatters are really expensive to alloc and init. Since you might have a lot of Game objects,
             allocing 2 formatters on init of each object can get inefficient. Instead, use 2 static variables.
             These will persist across all instances of the class.
             */
            
            static NSDateFormatter *sESTTimeFormat = nil, *sLocalTimeFormat = nil;
            
            /* OK, now run the alloc init inside a dispatch_once block. Dispatch_once is exactly what it sounds like-
             the code inside the block is only run once in the life of the application. So upon the first call to
             a Game object's initWithGameDataMethod: the static variables will be assigned. After that, each init
             call will use the same 2 formatters we alloced inside this block. */
            
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                sESTTimeFormat = [[NSDateFormatter alloc] init];
                [sESTTimeFormat setTimeZone:[NSTimeZone timeZoneWithName:@"EST"]];
                [sESTTimeFormat setDateFormat:@"h:mm a"];
                [sESTTimeFormat setLocale:[[NSLocale alloc]
                                          initWithLocaleIdentifier:@"en_US_POSIX"]];
                
                sLocalTimeFormat = [[NSDateFormatter alloc] init];
				[sLocalTimeFormat setTimeStyle:NSDateFormatterShortStyle];
                [sLocalTimeFormat setLocale:[[NSLocale alloc]
                                            initWithLocaleIdentifier:@"en_US_POSIX"]];
            });
			
			NSDate *estTime = [sESTTimeFormat
                               dateFromString:[gameData objectForKey:@"period"]];
            
			if (estTime) {
				self.period = [sLocalTimeFormat stringFromDate:estTime];
			} else {
				self.period = [gameData objectForKey:@"period"];
			}
			
            self.shortAwayTeam = [gameData objectForKey:@"shortAwayTeam"];
            self.shortHomeTeam = [gameData objectForKey:@"shortHomeTeam"];
            
            return self;
        }
    }
    
    return nil;
}

@end
