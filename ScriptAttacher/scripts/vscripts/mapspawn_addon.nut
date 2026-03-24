Entities.EnableEntityListening();

if ( CLIENT_DLL )
{
	printl("\n>>>>>>>>>>Script Attacher<<<<<<<<<<")
	printl(">>>>>>>>>>>Verson 1.2.6<<<<<<<<<<<<")
	printl(">>>>>>>>>>>>>Original code By IBRS, edited by meow meow meow<<<<<<<<<<<<<\n")
}

// DATA DUMP
// https://gist.githubusercontent.com/samisalreadytaken/7b85fa38a2c9cac9bfefa3440f9efb4f/raw/1bd9010fe3ccdf12ddab7970911f96df5c31ef53/datadump_ai_ally_speech_manager_sv.log

Hooks.Add( this, "OnEntitySpawned", function(ent)
{
	try
	{
		ent.ValidateScriptScope();
		local scope = ent.GetScriptScope();
		scope.Precache <- function() {}
		IncludeScript("game_entities/" + ent.GetClassname(), scope);
		
		if ("Precache" in scope)
		{
			scope.Precache();
		}
		
		printl("Running code on game entity: " + scope);
	}
	catch(exception)
	{
		printl(exception);
	}
}, "SCRIPT_ATTACHER_ONCREATEHOOK" );

Hooks.Add( this, "OnEntitySpawned", function(ent)
{
	try
	{
		ent.ValidateScriptScope();
		local scope = ent.GetScriptScope();
		scope.OnPostSpawn <- function() {}
		scope.Spawn <- function() {}
		scope.Init <- function() {}
		IncludeScript("game_entities/" + ent.GetClassname(), scope);
		
		if ("Init" in scope)
		{
			scope.Init();
		}
		if ("Spawn" in scope)
		{
			scope.Spawn();
		}
		// Support 'OnPostSpawn'
		if ("OnPostSpawn" in scope)
		{
			scope.OnPostSpawn();
		}
		
		printl("Running code on game entity: " + scope);
	}
	catch(exception)
	{
		printl(exception);
	}
}, "SCRIPT_ATTACHER_ONSPAWNHOOK" );
