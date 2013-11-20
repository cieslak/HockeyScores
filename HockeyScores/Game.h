//
//  Game.h
//  HockeyScores
//
//  Created by Jason Leyrer on 11/19/13.
//  Copyright (c) 2013 Jason Leyrer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property (nonatomic, strong) NSString *awayScore;
@property (nonatomic, strong) NSString *awayTeam;
@property (nonatomic, strong) NSString *awayTeamCity;
@property (nonatomic, strong) NSString *awayTeamName;
@property (nonatomic, strong) NSString *event;
@property (nonatomic, strong) NSString *homeScore;
@property (nonatomic, strong) NSString *homeTeam;
@property (nonatomic, strong) NSString *homeTeamCity;
@property (nonatomic, strong) NSString *homeTeamName;
@property (nonatomic, assign) BOOL isPlaying;
@property (nonatomic, strong) NSString *period;
@property (nonatomic, strong) NSString *shortAwayTeam;
@property (nonatomic, strong) NSString *shortHomeTeam;

- (id)initWithGameData:(NSDictionary *)gameData;

@end
