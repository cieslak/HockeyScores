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
            self.period = [gameData objectForKey:@"period"];
            self.shortAwayTeam = [gameData objectForKey:@"shortAwayTeam"];
            self.shortHomeTeam = [gameData objectForKey:@"shortHomeTeam"];
            
            return self;
        }
    }
    
    return nil;
}

@end