state("PillarsOfLight") {}

startup
{
	Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
}

init
{
    vars.Helper.TryLoad  = (Func<dynamic, bool>)(mono =>
        {
            vars.Helper["levelIndex"] = mono.Make<int>("AutosplitVariables", "levelIndex");
            vars.Helper["isLoading"] = mono.Make<bool>("AutosplitVariables", "isLoading");
            vars.Helper["isPaused"] = mono.Make<bool>("AutosplitVariables", "isPaused");
            return true;
        });
}

update
{
    
}

start
{
    return current.levelIndex > 0;
}

split
{
    return current.levelIndex > old.levelIndex && old.levelIndex > 0;
}

isLoading
{
    return current.isLoading || current.isPaused;
}

reset 
{
    /* If you're in the main menu with a playtime of 0, you probably just reset your save file,
    * and you definitely aren't in a current run, so reset the timer.
    */
    return current.levelIndex == 0;
}

exit
{
    
}

shutdown
{
    
}
