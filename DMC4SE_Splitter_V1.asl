//*********************************************** Created by Mysterion_06_ ***************************************************
//*************************************** Credits: DECosmic & Lonerhero for testing *******************************************

//                                                       Disclaimer: 
//                 If you play the MainGame tick the Chapter DN/V/LT and if you want to use the doorsplitter, tick DN/V or LT
//                 If you play Boss Rush, untick BPS and MainGame, tick LRT & BossRush
//                 If you play Bloody Palace, untick BossRush and MainGame, tick LRT & BPS
//                 If you are having lags or you are dropping frames, go to speedrun.com and download the .exe file and exchange it with yours + tick the droppingFrames option in the settings
//                 To use this splitter, you have to downpatch your game and exchange your .exe and .dll file to get your game to downpatch, a tutorial for that is on the discord server or speedrun.com
//                 Downpatch not needed anymore, only if you want to use the trainer of this game

state("DevilMayCry4SpecialEdition", "Old Patch")
{
    int missionNumber:      0xF59F00, 0x150;                                //Chapter 1-20 All Characters
    int missionTime:        0xF59F00, 0x264;                                //missionTime for each Chapter
    int cutscene:           0xF59F00, 0x1A4;                                //Cutscenes    
    int playerPos:          0xF59F00, 0x24;                                 //Stops the timer at Loading screens
    int LoadingScreen:      0xF59F00, 0x14C;                                //Used to start the timer when entering the Stage in BP
    int m1LRT:              0xF59F00, 0x140;                                //Used to remove loadings of mission 1
    int bloodyPalace:       0xF23F38, 0x3830, 0x90;                         //Bloody palace stage
    int boss:               0xF23F38, 0x3834, 0x50, 0x0;                    //Used to split for Stage 101 in BP and Mission 20
    int doorsplitter:       0xF23F38, 0x3830, 0x88;                         //Current room Im in, shown in numbers
    int menu:               0xF240A4, 0x2B4;                                //menu to stop the timer at menu screen
    int menu4:              0xF23F84, 0x70, 0x1C;                           //Another menu used to stop the timer at menu screen
    int ngPlusReset:        0xEC9A34, 0x4;                                  //Reset for NG+
    int ngStart:            0xF23F80, 0x4;                                  //Starting timer for NG after the savefile was created
    int KillCount:          0xF59F0C, 0x1D4;                                //Counts all kills throughout the game
}

state("DevilMayCry4SpecialEdition", "Current Patch"){
    int missionNumber:      0xEDEEC4, 0x150;                                //Chapter 1-20 All Characters*
    int missionTime:        0xEDEEC4, 0x264;                                //missionTime for each Chapter*
    int cutscene:           0xEDEEC4, 0x1A4;                                //Cutscenes*
    int playerPos:          0xEDEEC4, 0x24;                                 //Stops the timer at Loading screens*
    int LoadingScreen:      0xEDEEC4, 0x14C;                                //Used to start the timer when entering the Stage in BP*
    int m1LRT:              0xEDEEC4, 0x140;                                //Used to remove loadings of mission 1*
    int bloodyPalace:       0xE7E33C, 0x60, 0x1B0;                          //Bloody palace stage*
    int boss:               0xE7E33C, 0x64, 0x174, 0x0;                     //Used to split for Stage 101 in BP and Mission 20
    int doorsplitter:       0xE7E33C, 0x60, 0x1A8;                          //Current room Im in, shown in numbers*
    int menu:               0xEA9068, 0x2B4;                                //menu to stop the timer at menu screen
    int menu4:              0xE7E388, 0x70, 0x1C;                           //Another menu used to stop the timer at menu screen
    int ngPlusReset:        0xE7E340, 0x4;                                  //Reset for NG+*
    int ngStart:            0xE7E384, 0x4;                                  //Starting timer for NG after the savefile was created
}

init
{
    //Version checker
    switch (modules.First().ModuleMemorySize) {
        default:
        version = "Old Patch";
        break;
        case (16154624):
        version = "Current Patch";
        break;
    }

    //Sets the refreshRate of the splitter to a certain value depending on the settings you run the game with. (Should only be used by people with weak PCs *Read Tooltip*)
    if(settings["60FPS"]){
        refreshRate = 30;
    }
    if(settings["Variables"]){
        refreshRate = 60;
    }

    vars.split = 0;     //Sets the current split to 0
    vars.rush = 0;      //Sets rush to 0
    vars.m7 = 0;        //Sets m7 to 0

    //current.doorsplitter, old.doorsplitter, current.missionNumber, vars.split
    vars.doorSplit = new List<Tuple<int, int, int, int>>{
        //Mission 2
        Tuple.Create(2, 2, 2, 0),
        Tuple.Create(4, 2, 2, 1),
        Tuple.Create(3, 4, 2, 2),
        Tuple.Create(4, 3, 2, 3),
        Tuple.Create(5, 4, 2, 4),
        Tuple.Create(6, 5, 2, 5),
        Tuple.Create(7, 6, 2, 6),
        Tuple.Create(6, 7, 2, 7),
        Tuple.Create(7, 6, 2, 8),
        Tuple.Create(6, 7, 2, 9),
        Tuple.Create(8, 6, 2, 10),
        Tuple.Create(9, 8, 2, 11),
        //Mission 3
        Tuple.Create(105, 105, 3, 12),
        Tuple.Create(200, 105, 3, 13),
        Tuple.Create(201, 200, 3, 14),
        Tuple.Create(203, 201, 3, 15),
        Tuple.Create(200, 203, 3, 16),
        Tuple.Create(204, 200, 3, 17),
        Tuple.Create(205, 204, 3, 18),
        Tuple.Create(204, 205, 3, 19),
        Tuple.Create(200, 204, 3, 20),
        Tuple.Create(206, 200, 3, 21),
        Tuple.Create(207, 206, 3, 22),
        //Mission 4
        Tuple.Create(206, 206, 4, 23),
        Tuple.Create(200, 206, 4, 24),
        Tuple.Create(201, 200, 4, 25),
        Tuple.Create(202, 201, 4, 26),
        Tuple.Create(201, 202, 4, 27),
        Tuple.Create(204, 201, 4, 28),
        //Mission 5
        Tuple.Create(210, 210, 5, 29),
        Tuple.Create(203, 210, 5, 30),
        Tuple.Create(211, 203, 5, 31),
        Tuple.Create(203, 211, 5, 32),
        Tuple.Create(201, 203, 5, 33),
        Tuple.Create(200, 201, 5, 34),
        Tuple.Create(212, 200, 5, 35),
        //Mission 6
        Tuple.Create(213, 213, 6, 36),
        Tuple.Create(214, 213, 6, 37),
        Tuple.Create(215, 214, 6, 38),
        Tuple.Create(217, 215, 6, 39),
        Tuple.Create(216, 217, 6, 40),
        Tuple.Create(212, 216, 6, 41),
        Tuple.Create(200, 212, 6, 42),
        Tuple.Create(204, 200, 6, 43),
        Tuple.Create(205, 204, 6, 44),
        Tuple.Create(300, 205, 6, 45),
        //Mission 7
        Tuple.Create(301, 301, 7, 46),
        Tuple.Create(302, 301, 7, 47),
        Tuple.Create(303, 302, 7, 48),
        Tuple.Create(308, 303, 7, 49),
        Tuple.Create(307, 308, 7, 50),
        //Mission 8
        Tuple.Create(305, 305, 8, 51),
        Tuple.Create(306, 305, 8, 52),
        Tuple.Create(301, 306, 8, 53),
        Tuple.Create(302, 301, 8, 54),
        Tuple.Create(311, 302, 8, 55),
        Tuple.Create(308, 311, 8, 56),
        Tuple.Create(304, 308, 8, 57),
        Tuple.Create(400, 304, 8, 58),
        //Mission 9
        Tuple.Create(401, 401, 9, 59),
        Tuple.Create(402, 401, 9, 60),
        Tuple.Create(403, 402, 9, 61),
        Tuple.Create(404, 403, 9, 62),
        //Mission 10
        Tuple.Create(403, 403, 10, 63),
        Tuple.Create(402, 403, 10, 64),
        Tuple.Create(401, 402, 10, 65),
        Tuple.Create(405, 401, 10, 66),
        Tuple.Create(406, 405, 10, 67),
        Tuple.Create(407, 406, 10, 68),
        Tuple.Create(408, 407, 10, 69),
        //Mission 12
        Tuple.Create(407, 407, 12, 70),
        Tuple.Create(406, 407, 12, 71),
        Tuple.Create(405, 406, 12, 72),
        Tuple.Create(401, 405, 12, 73),
        Tuple.Create(400, 401, 12, 74),
        //Mission 13
        Tuple.Create(304, 304, 13, 75),
        Tuple.Create(308, 304, 13, 76),
        Tuple.Create(301, 308, 13, 77),
        Tuple.Create(306, 301, 13, 78),
        Tuple.Create(305, 306, 13, 79),
        Tuple.Create(301, 305, 13, 80),
        Tuple.Create(302, 301, 13, 81),
        Tuple.Create(311, 302, 13, 82),
        Tuple.Create(308, 311, 13, 83),
        Tuple.Create(307, 308, 13, 84),
        //Mission 14
        Tuple.Create(305, 305, 14, 85),
        Tuple.Create(306, 305, 14, 86),
        Tuple.Create(301, 306, 14, 87),
        Tuple.Create(300, 301, 14, 88),
        Tuple.Create(205, 300, 14, 89),
        //Mission 15
        Tuple.Create(204, 204, 15, 90),
        Tuple.Create(200, 204, 15, 91),
        Tuple.Create(206, 200, 15, 92),
        Tuple.Create(207, 206, 15, 93),
        Tuple.Create(201, 207, 15, 94),
        Tuple.Create(202, 201, 15, 95),
        Tuple.Create(201, 202, 15, 96),
        Tuple.Create(203, 201, 15, 97),
        Tuple.Create(210, 203, 15, 98),
        Tuple.Create(209, 210, 15, 99),
        Tuple.Create(204, 209, 15, 100),
        //Mission 16
        Tuple.Create(200, 200, 16, 101),
        Tuple.Create(105, 200, 16, 102),
        Tuple.Create(100, 105, 16, 103),
        Tuple.Create(9, 100, 16, 104),
        //Mission 17
        Tuple.Create(6, 6, 17, 105),
        Tuple.Create(5, 6, 17, 106),
        Tuple.Create(12, 5, 17, 107),
        Tuple.Create(11, 12, 17, 108),
        Tuple.Create(10, 11, 17, 109),
        //Mission 19
        Tuple.Create(501, 501, 19, 110),
        Tuple.Create(507, 501, 19, 111),
        Tuple.Create(501, 507, 19, 112),
        Tuple.Create(503, 501, 19, 113),
        Tuple.Create(501, 503, 19, 114),
        Tuple.Create(504, 501, 19, 115),
        Tuple.Create(501, 504, 19, 116),
        Tuple.Create(505, 501, 19, 117),
        Tuple.Create(501, 505, 19, 118),
        Tuple.Create(506, 501, 19, 119),
        Tuple.Create(501, 506, 19, 120),
        //Mission 20 (Only Nero & Dante)
        Tuple.Create(13, 13, 20, 121),
    };
}

startup
{
    settings.Add("DMC4SE", true, "DMC4SE");
    settings.SetToolTip("DMC4SE", "Do not uncheck this box");

    settings.CurrentDefaultParent = "DMC4SE";
    settings.Add("DroppingFrames", false, "DroppingFrames");
    settings.SetToolTip("DroppingFrames", "Check this box if you have a lot of dropped frames or the splitter isnt working correctly on your end");
    settings.CurrentDefaultParent = "DroppingFrames";
    settings.Add("60FPS");
    settings.Add("Variables");
    settings.SetToolTip("60FPS", "Check this box if you play DMC4 with 60FPS or less");
    settings.SetToolTip("Variables", "Check this box if you play DMC4 with the variables settings");

    settings.CurrentDefaultParent = "DMC4SE";
    settings.Add("MainGame");
    settings.CurrentDefaultParent = "MainGame";
    settings.Add("DoorSplitter", false, "DoorSplitter");
    settings.CurrentDefaultParent = "DoorSplitter";
    settings.Add("DN/V", false, "DN/V");
    settings.SetToolTip("DN/V", "Check this box if you want to run with Doorsplits as Dante/Nero or Vergil");
    settings.Add("LT", false, "LT");
    settings.SetToolTip("LT", "Check this box if you want to run with Doorsplits as Lady/Trish");
    
    settings.CurrentDefaultParent = "DMC4SE";
    settings.Add("BloodyPalace/BossRush", false, "BloodyPalace/BossRush");
    settings.CurrentDefaultParent = "BloodyPalace/BossRush";
    settings.Add("BPS", false, "BPS");
    settings.SetToolTip("BPS", "Check this box if you want to run with Stagesplits in Bloody Palace");
    settings.Add("BossRush", false, "BossRush");
    settings.CurrentDefaultParent = "BossRush";
    settings.SetToolTip("BossRush", "Uncheck this box if you DON'T do BossRush");
    settings.Add("Berial");
    settings.Add("Bael");
    settings.Add("Echidna");
    settings.Add("Credo");
    settings.Add("Agnus");
    settings.Add("Dante");
    
    //Asks the user to set his timer to game time on livesplit, which is needed for verification
    if (timer.CurrentTimingMethod == TimingMethod.RealTime) // Inspired by the Modern warfare 3 Autosplitter
    {        
        var timingMessage = MessageBox.Show (
            "This game uses Time without Loads (Game Time) as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time? This will make verification easier.",
            "LiveSplit | Devil May Cry 4",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question);
        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
}

start
{
    //Starts the timer after creating the savefile in NG, choosing costume in NG+, starting BossRush at Stage 20, start BP at Stage 1
    if((current.ngPlusReset == 352 && current.ngStart == 0 && old.ngStart > 0 && current.missionNumber == 1 && settings["MainGame"])
    || 
    (current.ngPlusReset != 592 && old.ngPlusReset == 592 && settings["MainGame"] && current.ngPlusReset != 352)
    ||
    (current.bloodyPalace == 20 && current.LoadingScreen > 0 && settings["BossRush"])
    ||
    (current.bloodyPalace == 1 && current.LoadingScreen > 0 && settings["BPS"]))
    {              
        vars.split = 0;     //Sets the current Split to 0
        vars.rush = 0;      //Sets the current BossRush to 0
        vars.m7 = 0;        //Sets m7 to 0
        return true;
    }
}


split
{
    //Dante/Nero, Vergil and Lady/Trish Chapter splitter
    if((current.missionNumber > old.missionNumber) 
    || 
    ((current.boss == 33620487 && old.boss != 33620487 || current.boss == 265223 && old.boss != 265223) && current.missionNumber == 20)){
        return true;
    }

    //Doorsplitter for Dante/Nero, Vergil and Lady/Trish
    if((settings["DN/V"] || settings["LT"]) && vars.doorSplit.Contains(Tuple.Create(current.doorsplitter, old.doorsplitter, current.missionNumber, vars.split))){
        vars.split++;
        return true;        
    }

    //Lady/Trish Mission 7 & 15 split
    if(settings["LT"]){
        if((settings["LT"] && current.missionNumber == 7 && current.doorsplitter == 305 && old.doorsplitter == 303 && vars.m7 == 0)
        ||
        (current.missionNumber == 7 && current.doorsplitter == 306 && old.doorsplitter == 305 && vars.m7 == 1)
        ||
        (current.missionNumber == 7 && current.doorsplitter == 303 && old.doorsplitter == 306 && vars.m7 == 2)
        ||
        (current.missionNumber == 7 && current.doorsplitter == 303 && old.doorsplitter == 301 && vars.m7 == 3)
        ||
        (current.missionNumber == 15 && (current.doorsplitter == 211 && old.doorsplitter == 203 || current.doorsplitter == 203 && old.doorsplitter == 211))){
            vars.m7++;
            return true;
        }
    }

    //BloodyPalace Splitter
    if(settings["BPS"] && old.bloodyPalace != current.bloodyPalace || settings["BPS"] && current.boss == 16850701 && old.boss != 16850701 && current.bloodyPalace == 101){
        return true;
    }

    //BossRush Splitter
    if(settings["BossRush"] && old.bloodyPalace < current.bloodyPalace || settings["BossRush"] && current.boss == 16850701 && old.boss != 16850701 && current.bloodyPalace == 101){ 
        vars.rush = (vars.rush + 1);
        if((settings["Berial"] && vars.rush == 1)
        ||
        (settings["Bael"] && vars.rush == 2)
        ||
        (settings["Echidna"] && vars.rush == 3)
        ||
        (settings["Credo"] && vars.rush == 4)
        ||
        (settings["Agnus"] && vars.rush == 5)
        ||
        (settings["Dante"] && vars.rush == 6)){
            return true;
        }
    }
}

reset
{
    if((current.missionNumber < old.missionNumber || current.ngPlusReset == 592 && settings["MainGame"])   //Reset for MainGame, when back in Main Menu
    || 
    (current.ngPlusReset == 592 && old.ngPlusReset != 592 && settings["BossRush"])                     //Reset for BossRush when going to Main Menu
    || 
    (current.ngPlusReset == 592 && old.ngPlusReset != 592 && settings["BPS"])){                        //Reset for BloodyPalace when going to Main Menu
        return true;
    }
}

isLoading
{
    //Loadremover, removes Loads at the end of a chapter, going through doors, cutscenes, when pausing the game and when a loadingscreen appears
    if(((current.playerPos == 00000000 || current.cutscene > 0 ) && current.ngPlusReset != 928 && current.missionNumber != 1 && current.ngPlusReset != 592 || current.cutscene > 0 && current.ngPlusReset != 592) 
    || 
    (current.menu4 > 0 && current.menu == 0 && current.missionTime == old.missionTime && current.missionNumber != 1 && current.ngPlusReset != 592)
    || 
    (current.m1LRT == 0 && current.missionNumber == 1 && current.missionTime == old.missionTime && current.ngPlusReset != 928 && current.ngPlusReset != 592)){
        return true;
    }
    else{
        return false;
    }
}
