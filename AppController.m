// iscinterface
// $Id$

#import "AppController.h"

@implementation AppController

+ (void) initialize
{ 
	NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
	ChessServerList *defaultServers = [[ChessServerList alloc] init];
	NSData *serverData;
	[defaultServers addNewServerName: @"Free Internet Chess Server (FICS)" Address: @"69.36.243.188" port: 5000 userName: nil userPassword: nil 
	 initCommands: @"iset seekremove 1\niset seekinfo 1\n"];
	serverData = [NSKeyedArchiver archivedDataWithRootObject:defaultServers];
	[defaultValues setObject:serverData forKey:@"ICSChessServers"];
	[[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];
	gSounds = [[Sound alloc] init];
}

- (void) dealloc
{
	[chessServerListControl release];
	[super dealloc];
}

- (IBAction) selectServer: (id) sender
{
	if (chessServerListControl == nil)
		chessServerListControl = [[ChessServerListControl alloc] init];
	[chessServerListControl show: sender];
}

- (IBAction) newSeek: (id) sender
{
	if (seekControl == nil)
		seekControl = [[SeekControl alloc] init];
	[seekControl show: sender];
}

@end
