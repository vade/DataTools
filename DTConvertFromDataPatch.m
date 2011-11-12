#import "DTConvertFromDataPatch.h"

@implementation DTConvertFromDataPatch
+(BOOL)isSafe
{
	return NO;
}

+(BOOL)allowsSubpatchesWithIdentifier:(id)identifier
{
	return NO;
}

+(int)executionModeWithIdentifier:(id)identifier
{
	return 0;
}

+(int)timeModeWithIdentifier:(id)identifier
{
	return 0;
}

-(id)initWithIdentifier:(id)identifier
{
	if(self = [super initWithIdentifier:identifier])
	{
		[[self userInfo] setObject:@"Kineme Convert From Data" forKey:@"name"];
	}
	return self;
}

-(BOOL)setup:(QCOpenGLContext*)context
{
	return YES;
}

-(void)cleanup:(QCOpenGLContext*)context
{
}

-(void)enable:(QCOpenGLContext*)context
{
}

-(void)disable:(QCOpenGLContext*)context
{
}

-(BOOL)execute:(QCOpenGLContext*)context time:(double)time arguments:(NSDictionary*)arguments
{
	if ([inputRawData wasUpdated])
	{
		id object = ([inputRawData value] ? [NSUnarchiver unarchiveObjectWithData:[inputRawData value]] : nil); 
		[outputObject setRawValue:object]; 
	}
	
	return YES;
}

@end
