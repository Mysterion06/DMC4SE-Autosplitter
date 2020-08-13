//*********************************************** Created by Mysterion_06_ ***************************************************
//***************************************** Credits: Mysterion_06_ & Wipefinger **********************************************


//                                                       Disclaimer: 
//                 If you are running the main game, untick everything except LRT and Chapter 1-20 depending on the campaign you play
//                 If you do doorsplitter, untick everything except LRT, Doorsplitter and Chapter 1-20 depending on the campaign you play
//                 For example you play Vergil doorsplits: tick LRT, DoorSplitterV & Chapter 1-20V
//                 If you play Boss Rush, untick BPS and MainGame, tick LRT & BossRush
//                 If you play Bloody Palace, untick BossRush and MainGame, tick LRT & BPS
//                 IF YOU PLAY NG+ NEVER EVER RESET AT CHAPTER 1, ATLEAST PLAY PAST CHAPTER 1, TO NOT GET AN INFINITY LOOP thank u
//                 If you are having lags or you are dropping frames, go to speedrun.com and download the .exe file and exchange it with yours
//                 To use this splitter, you have to downpatch your game and exchange your .exe and .dll file to get your game to downpatch, a tutorial for that is on the discord server or speedrun.com

state("DevilmayCry4SpecialEdition")

{
    int missionNumber: 0xF59F00, 0x150;             //Chapter 1-20 All Characters
    int missionStart: 0x00F59F00, 0x1A8;            //Mission menu start mission 1 All Characters
    int roomID: 0x1359F00, 0x154;                   //Current room Im in, shown in numbers
    int missionTime: 0xF59F00, 0x264;               //missionTime for each Chapter
    int cutscene: 0xF59F00, 0x1A4;                  //Cutscenes
    int missionNumberVHoH: 0x1359F10, 0x104;        //Vergil missionNumber Heaven or Hell
    int MenuOptionNumber: 0x00F240A4, 0x48, 0x280;  //MenuOptionNumber
    int bossStart: 0xf59f00, 0x120;                 //Boss start
    int playerPos: 0xf59f00, 0x24;                  // ?
    int csFlag: 0xf59f00, 0x17C;                    //Cutscene Event Flag (?)
    int LoadingScreen: 0xF59F00, 0x14C;             //Pointer that is used to improvise the Loading screen
    int bloodyPalace: 0xF23F38, 0x3830, 0x90;       //Bloody palace stage
    int boss: 0xF23F38, 0x3834, 0x50, 0x0;          //A random value that changes, after doing certain stuff, used for splitting
    int bloodyStart: 0xF23F38, 0x3834, 0x10034;     //Bloody Palace starts
    int palaceCharacter: 0x00F240A4, 0x48, 0x380;   //Which character you choose for bloody palace
    int screen: 0xf59f00, 0x140;                    // ?
    int doorsplitter: 0xF23F38, 0x3830, 0x88;       //Current room Im in, shown in numbers
    int stylepoints: 0xF59F00, 0x250;               //Your Devil Hunter Rank in points at the result screen
    int menu: 0xF240A4, 0x2B4;                      //menu to stop the timer at menu screen
    int menu4: 0xF23F84, 0x70, 0x1C;                //Another menu used to stop the timer at menu screen
    int menuReset: 0xF240A4, 0x44, 0xF8, 0xB8, 0x6C, 0x280; //Used to reset the timer in chapter selection
}

init
{
    if(settings["60FPS"]){
        refreshRate = 30;
    }
    if(settings["Variables"]){
        refreshRate = 60;
    }
    vars.split = 0; //Sets the current split to 0
    vars.chapter = 0; //Sets the current Chapter to 0
    vars.rush = 0; //sets rush to 0
}


startup
{
    //Options to choose
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
    settings.Add("Loadremover");
    settings.Add("MainGame");
    settings.CurrentDefaultParent = "Loadremover";
    settings.Add("LRT", false, "LRT");
    settings.SetToolTip("LRT", "Check this box if you want your Loads to be removed");


    settings.CurrentDefaultParent = "MainGame";
    settings.Add("DoorSplitter", false, "DoorSplitter");
    settings.CurrentDefaultParent = "DoorSplitter";
    settings.Add("DN", false, "DN");
    settings.Add("V", false, "V");
    settings.Add("LT", false, "LT");
    settings.CurrentDefaultParent = "MainGame";
    settings.Add("DN, V, LT", true, "DN, V, LT");
    settings.SetToolTip("DN, V, LT", "Always have this box ticked");
    settings.CurrentDefaultParent = "DN, V, LT";
    settings.Add("Chapter 1-20DN/V/LT");
    settings.CurrentDefaultParent = "Chapter 1-20DN/V/LT";
    settings.Add("Chapter 1");
    settings.Add("Chapter 2");
    settings.Add("Chapter 3");
    settings.Add("Chapter 4");
    settings.Add("Chapter 5");
    settings.Add("Chapter 6");
    settings.Add("Chapter 7");
    settings.Add("Chapter 8");
    settings.Add("Chapter 9");
    settings.Add("Chapter 10");
    settings.Add("Chapter 11");
    settings.Add("Chapter 12");
    settings.Add("Chapter 13");
    settings.Add("Chapter 14");
    settings.Add("Chapter 15");
    settings.Add("Chapter 16");
    settings.Add("Chapter 17");
    settings.Add("Chapter 18");
    settings.Add("Chapter 19");
    settings.Add("Chapter 20");
    

    settings.CurrentDefaultParent = "DMC4SE";
    settings.Add("BloodyPalace/BossRush", false, "BloodyPalace/BossRush");
    settings.CurrentDefaultParent = "BloodyPalace/BossRush";
    settings.Add("BPS", false, "BPS");
    settings.Add("BossRush", false, "BossRush");
    settings.CurrentDefaultParent = "BossRush";
    settings.SetToolTip("BossRush", "Uncheck this box if you DON'T do BossRush");
    settings.Add("Berial");
    settings.Add("Bael");
    settings.Add("Echidna");
    settings.Add("Credo");
    settings.Add("Agnus");
    settings.Add("Dante");
}



start
{
    if ((current.missionStart == 0 && current.menuReset == 0 && current.missionNumber == 1 && settings["MainGame"]) //Starts the splits for main game
    ||
    (current.bloodyPalace == 20 && current.LoadingScreen > 0 && settings["BossRush"])                               //Starts the splits for BossRush
    || 
    (current.bloodyPalace == 1 && current.LoadingScreen > 0 && settings["BPS"]))                                    //Starts the splits for Bloody Palace
    {              
        vars.split = 0;     //Sets the current Split to 0
        vars.chapter = 0;   //Sets the current Chapter to 0
        vars.rush = 0;      //Sets the current BossRush to 0
        return true;
    }

}



isLoading
{
    if(settings["LRT"]){
        if((current.playerPos == 00000000 || current.cutscene > 0 ) && current.missionTime != 0 && current.missionNumber != 1 || current.cutscene > 0 || current.menu4 > 0 && current.menu == 0 && current.missionTime == old.missionTime && current.missionNumber != 1){     //Loadremover, removes Loads at the end of a chapter, going through doors, cutscenes and when pausing the game
            return true;
        }
        else{
            return false;
        }
    }    
}




split
{
    //Dante/Nero, Vergil and Lady/Trish Chapter splitting
    if (current.missionNumber > old.missionNumber && settings["Chapter 1-20DN/V/LT"] || current.missionNumber == 20 && current.boss == 33620487 && settings["Chapter 1-20DN/V/LT"] && old.boss != 33620487){
        vars.chapter = (vars.chapter + 1);
        if (settings["Chapter 1"] && vars.chapter == 1){
            return true;
        }
        if (settings["Chapter 2"] && vars.chapter == 2){
            return true;
        }
        if (settings["Chapter 3"] && vars.chapter == 3){
            return true;
        }
        if (settings["Chapter 4"] && vars.chapter == 4){
            return true;
        }
        if (settings["Chapter 5"] && vars.chapter == 5){
            return true;
        }
        if (settings["Chapter 6"] && vars.chapter == 6){
            return true;
        }
        if (settings["Chapter 7"] && vars.chapter == 7){
            return true;
        }
        if (settings["Chapter 8"] && vars.chapter == 8){
            return true;
        }
        if (settings["Chapter 9"] && vars.chapter == 9){
            return true;
        }
        if (settings["Chapter 10"] && vars.chapter == 10){
            return true;
        }
        if (settings["Chapter 11"] && vars.chapter == 11){
            return true;
        }
        if (settings["Chapter 12"] && vars.chapter == 12){
            return true;
        }
        if (settings["Chapter 13"] && vars.chapter == 13){
            return true;
        }
        if (settings["Chapter 14"] && vars.chapter == 14){
            return true;
        }
        if (settings["Chapter 15"] && vars.chapter == 15){
            return true;
        }
        if (settings["Chapter 16"] && vars.chapter == 16){
            return true;
        }
        if (settings["Chapter 17"] && vars.chapter == 17){
            return true;
        }
        if (settings["Chapter 18"] && vars.chapter == 18){
            return true;
        }
        if (settings["Chapter 19"] && vars.chapter == 19){
            return true;
        }
        if (settings["Chapter 20"] && vars.chapter == 20){
            return true;
        }
    }

    //Vergil Doorsplits
    if(settings["V"] && settings["Chapter 1-20DN/V/LT"]){
        //Chapter 2
        if((current.doorsplitter == 2 && old.doorsplitter != 2 && current.missionNumber == 2 && vars.split == 0)
        ||
        (current.doorsplitter == 4 && old.doorsplitter == 2 && current.missionNumber == 2 && vars.split == 1)
        ||
        (current.doorsplitter == 3 && old.doorsplitter == 4 && current.missionNumber == 2 && vars.split == 2)
        ||
        (current.doorsplitter == 4 && old.doorsplitter == 3 && current.missionNumber == 2 && vars.split == 3)
        ||
        (current.doorsplitter == 5 && old.doorsplitter == 4 && current.missionNumber == 2 && vars.split == 4)
        ||
        (current.doorsplitter == 6 && old.doorsplitter == 5 && current.missionNumber == 2 && vars.split == 5)
        ||
        (current.doorsplitter == 7 && old.doorsplitter == 6 && current.missionNumber == 2 && vars.split == 6)
        ||
        (current.doorsplitter == 6 && old.doorsplitter == 7 && current.missionNumber == 2 && vars.split == 7)
        ||
        (current.doorsplitter == 7 && old.doorsplitter == 6 && current.missionNumber == 2 && vars.split == 8)
        ||
        (current.doorsplitter == 6 && old.doorsplitter == 7 && current.missionNumber == 2 && vars.split == 9)
        ||
        (current.doorsplitter == 8 && old.doorsplitter == 6 && current.missionNumber == 2 && vars.split == 10)
        ||
        (current.doorsplitter == 9 && old.doorsplitter == 8 && current.missionNumber == 2 && vars.split == 11)
        ||
        //Chapter 3
        (current.doorsplitter == 105 && old.doorsplitter != 105 && current.missionNumber == 3 && vars.split == 12)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 105 && current.missionNumber == 3 && vars.split == 13)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 200 && current.missionNumber == 3 && vars.split == 14)
        ||
        (current.doorsplitter == 203 && old.doorsplitter == 201 && current.missionNumber == 3 && vars.split == 15)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 203 && current.missionNumber == 3 && vars.split == 16)
        ||
        (current.doorsplitter == 204 && old.doorsplitter == 200 && current.missionNumber == 3 && vars.split == 17)
        ||
        (current.doorsplitter == 205 && old.doorsplitter == 204 && current.missionNumber == 3 && vars.split == 18)
        ||
        (current.doorsplitter == 204 && old.doorsplitter == 205 && current.missionNumber == 3 && vars.split == 19)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 204 && current.missionNumber == 3 && vars.split == 20)
        ||
        (current.doorsplitter == 206 && old.doorsplitter == 200 && current.missionNumber == 3 && vars.split == 21)
        ||
        (current.doorsplitter == 207 && old.doorsplitter == 206 && current.missionNumber == 3 && vars.split == 22)
        ||
        //Chapter 4
        (current.doorsplitter == 206 && old.doorsplitter != 206 && current.missionNumber == 4 && vars.split == 23)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 206 && current.missionNumber == 4 && vars.split == 24)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 200 && current.missionNumber == 4 && vars.split == 25)
        ||
        (current.doorsplitter == 202 && old.doorsplitter == 201 && current.missionNumber == 4 && vars.split == 26)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 202 && current.missionNumber == 4 && vars.split == 27)
        ||
        (current.doorsplitter == 204 && old.doorsplitter == 201 && current.missionNumber == 4 && vars.split == 28)
        ||
        //Chapter 5
        (current.doorsplitter == 210 && old.doorsplitter != 210 && current.missionNumber == 5 && vars.split == 29)
        ||
        (current.doorsplitter == 203 && old.doorsplitter == 210 && current.missionNumber == 5 && vars.split == 30)
        ||
        (current.doorsplitter == 211 && old.doorsplitter == 203 && current.missionNumber == 5 && vars.split == 31)
        ||
        (current.doorsplitter == 203 && old.doorsplitter == 211 && current.missionNumber == 5 && vars.split == 32)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 203 && current.missionNumber == 5 && vars.split == 33)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 201 && current.missionNumber == 5 && vars.split == 34)
        ||
        (current.doorsplitter == 212 && old.doorsplitter == 200 && current.missionNumber == 5 && vars.split == 35)
        ||
        //Chapter 6
        (current.doorsplitter == 213 && old.doorsplitter != 213 && current.missionNumber == 6 && vars.split == 36)
        ||
        (current.doorsplitter == 214 && old.doorsplitter == 213 && current.missionNumber == 6 && vars.split == 37)
        ||
        (current.doorsplitter == 215 && old.doorsplitter == 214 && current.missionNumber == 6 && vars.split == 38)
        ||
        (current.doorsplitter == 217 && old.doorsplitter == 215 && current.missionNumber == 6 && vars.split == 39)
        ||
        (current.doorsplitter == 216 && old.doorsplitter == 217 && current.missionNumber == 6 && vars.split == 40)
        ||
        (current.doorsplitter == 212 && old.doorsplitter == 216 && current.missionNumber == 6 && vars.split == 41)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 212 && current.missionNumber == 6 && vars.split == 42)
        ||
        (current.doorsplitter == 204 && old.doorsplitter == 200 && current.missionNumber == 6 && vars.split == 43)
        ||
        (current.doorsplitter == 205 && old.doorsplitter == 204 && current.missionNumber == 6 && vars.split == 44)
        ||
        (current.doorsplitter == 300 && old.doorsplitter == 205 && current.missionNumber == 6 && vars.split == 45)
        ||
        //Chapter 7
        (current.doorsplitter == 301 && old.doorsplitter != 301 && current.missionNumber == 7 && vars.split == 46)
        ||
        (old.doorsplitter == 301 && current.doorsplitter == 302 && current.missionNumber == 7 && vars.split == 47)
        ||
        (old.doorsplitter == 302 && current.doorsplitter == 303 && current.missionNumber == 7 && vars.split == 48)
        ||
        (old.doorsplitter == 303 && current.doorsplitter == 305 && current.missionNumber == 7) && vars.split == 49
        ||
        (old.doorsplitter == 305 && current.doorsplitter == 306 && current.missionNumber == 7 && vars.split == 50)
        ||
        (old.doorsplitter == 306 && current.doorsplitter == 301 && current.missionNumber == 7 && vars.split == 51)
        ||
        (old.doorsplitter == 301 && current.doorsplitter == 303 && current.missionNumber == 7 && vars.split == 52)
        ||
        (old.doorsplitter == 303 && current.doorsplitter == 308 && current.missionNumber == 7 && vars.split == 53)
        ||
        (old.doorsplitter == 308 && current.doorsplitter == 307 && current.missionNumber == 7 && vars.split == 54)
        ||
        //Chapter 8
        (current.doorsplitter == 305 && old.doorsplitter != 305 && current.missionNumber == 8 && vars.split == 55)
        ||
        (current.doorsplitter == 306 && old.doorsplitter == 305 && current.missionNumber == 8 && vars.split == 56)
        ||
        (current.doorsplitter == 301 && old.doorsplitter == 306 && current.missionNumber == 8 && vars.split == 57)
        ||
        (current.doorsplitter == 302 && old.doorsplitter == 301 && current.missionNumber == 8 && vars.split == 58)
        ||
        (current.doorsplitter == 311 && old.doorsplitter == 302 && current.missionNumber == 8 && vars.split == 59)
        ||
        (current.doorsplitter == 308 && old.doorsplitter == 311 && current.missionNumber == 8 && vars.split == 60)
        ||
        (current.doorsplitter == 304 && old.doorsplitter == 308 && current.missionNumber == 8 && vars.split == 61)
        ||
        (current.doorsplitter == 400 && old.doorsplitter == 304 && current.missionNumber == 8 && vars.split == 62)
        ||
        //Chapter 9
        (current.doorsplitter == 401 && old.doorsplitter != 401 && current.missionNumber == 9 && vars.split == 63)
        ||
        (current.doorsplitter == 402 && old.doorsplitter == 401 && current.missionNumber == 9 && vars.split == 64)
        ||
        (current.doorsplitter == 403 && old.doorsplitter == 402 && current.missionNumber == 9 && vars.split == 65)
        ||
        (current.doorsplitter == 404 && old.doorsplitter == 403 && current.missionNumber == 9 && vars.split == 66)
        ||
        //Chapter 10
        (current.doorsplitter == 403 && old.doorsplitter != 403 && current.missionNumber == 10 && vars.split == 67)
        ||
        (current.doorsplitter == 402 && old.doorsplitter == 403 && current.missionNumber == 10 && vars.split == 68)
        ||
        (current.doorsplitter == 401 && old.doorsplitter == 402 && current.missionNumber == 10 && vars.split == 69)
        ||
        (current.doorsplitter == 405 && old.doorsplitter == 401 && current.missionNumber == 10 && vars.split == 70)
        ||
        (current.doorsplitter == 406 && old.doorsplitter == 405 && current.missionNumber == 10 && vars.split == 71)
        ||
        (current.doorsplitter == 407 && old.doorsplitter == 406 && current.missionNumber == 10 && vars.split == 72)
        ||
        (current.doorsplitter == 408 && old.doorsplitter == 407 && current.missionNumber == 10 && vars.split == 73)
        ||
        //Chapter 12
        (current.doorsplitter == 407 && old.doorsplitter != 407 && current.missionNumber == 12 && vars.split == 74)
        ||
        (current.doorsplitter == 406 && old.doorsplitter == 407 && current.missionNumber == 12 && vars.split == 75)
        ||
        (current.doorsplitter == 405 && old.doorsplitter == 406 && current.missionNumber == 12 && vars.split == 76)
        ||
        (current.doorsplitter == 401 && old.doorsplitter == 405 && current.missionNumber == 12 && vars.split == 77)
        ||
        (current.doorsplitter == 400 && old.doorsplitter == 401 && current.missionNumber == 12 && vars.split == 78)
        ||
        //Chapter 13
        (current.doorsplitter == 304 && old.doorsplitter != 304 && current.missionNumber == 13  && vars.split == 79)
        ||
        (current.doorsplitter == 308 && old.doorsplitter == 304 && current.missionNumber == 13 && vars.split == 80)
        ||
        (current.doorsplitter == 301 && old.doorsplitter == 308 && current.missionNumber == 13 && vars.split == 81)
        ||
        (current.doorsplitter == 306 && old.doorsplitter == 301 && current.missionNumber == 13 && vars.split == 82)
        ||
        (current.doorsplitter == 305 && old.doorsplitter == 306 && current.missionNumber == 13 && vars.split == 83)
        ||
        (current.doorsplitter == 301 && old.doorsplitter == 305 && current.missionNumber == 13 && vars.split == 84)
        ||
        (current.doorsplitter == 302 && old.doorsplitter == 301 && current.missionNumber == 13 && vars.split == 85)
        ||
        (current.doorsplitter == 311 && old.doorsplitter == 302 && current.missionNumber == 13 && vars.split == 86)
        ||
        (current.doorsplitter == 308 && old.doorsplitter == 311 && current.missionNumber == 13 && vars.split == 87)
        ||
        (current.doorsplitter == 307 && old.doorsplitter == 308 && current.missionNumber == 13 && vars.split == 88)
        ||
        //Chapter 14
        (current.doorsplitter == 305 && old.doorsplitter != 305 && current.missionNumber == 14 && vars.split == 89)
        ||
        (old.doorsplitter == 305 && current.doorsplitter == 306 && current.missionNumber == 14 && vars.split == 90)
        ||
        (old.doorsplitter == 306 && current.doorsplitter == 301 && current.missionNumber == 14 && vars.split == 91)
        ||
        (old.doorsplitter == 301 && current.doorsplitter == 300 && current.missionNumber == 14 && vars.split == 92)
        ||
        (old.doorsplitter == 300 && current.doorsplitter == 205 && current.missionNumber == 14 && vars.split == 93)
        ||
        //Chapter 15
        (current.doorsplitter == 204 && old.doorsplitter != 204 && current.missionNumber == 15 && vars.split == 94)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 204 && current.missionNumber == 15 && vars.split == 95)
        ||
        (current.doorsplitter == 206 && old.doorsplitter == 200 && current.missionNumber == 15 && vars.split == 96)
        ||
        (current.doorsplitter == 207 && old.doorsplitter == 206 && current.missionNumber == 15 && vars.split == 97)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 207 && current.missionNumber == 15 && vars.split == 98)
        ||
        (current.doorsplitter == 202 && old.doorsplitter == 201 && current.missionNumber == 15 && vars.split == 99)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 202 && current.missionNumber == 15 && vars.split == 100)
        ||
        (current.doorsplitter == 203 && old.doorsplitter == 201 && current.missionNumber == 15 && vars.split == 101)
        ||
        (current.doorsplitter == 210 && old.doorsplitter == 203 && current.missionNumber == 15 && vars.split == 102)
        ||
        (current.doorsplitter == 209 && old.doorsplitter == 210 && current.missionNumber == 15 && vars.split == 103)
        ||
        (current.doorsplitter == 204 && old.doorsplitter == 209 && current.missionNumber == 15 && vars.split == 104)
        ||
        //Chapter 16
        (current.doorsplitter == 200 && old.doorsplitter != 200 && current.missionNumber == 16 && vars.split == 105)
        ||
        (current.doorsplitter == 105 && old.doorsplitter == 200 && current.missionNumber == 16 && vars.split == 106)
        ||
        (current.doorsplitter == 100 && old.doorsplitter == 105 && current.missionNumber == 16 && vars.split == 107)
        ||
        (current.doorsplitter == 9 && old.doorsplitter == 100 && current.missionNumber == 16 && vars.split == 108)
        ||
        //Chapter 17
        (current.doorsplitter == 6 && old.doorsplitter != 6 && current.missionNumber == 17 && vars.split == 109)
        ||
        (current.doorsplitter == 5 && old.doorsplitter == 6 && current.missionNumber == 17 && vars.split == 110)
        ||
        (current.doorsplitter == 12 && old.doorsplitter == 5 && current.missionNumber == 17 && vars.split == 111)
        ||
        (current.doorsplitter == 11 && old.doorsplitter == 12 && current.missionNumber == 17 && vars.split == 112)
        ||
        (current.doorsplitter == 10 && old.doorsplitter == 11 && current.missionNumber == 17 && vars.split == 113)
        ||
        //Chapter 19
        (current.doorsplitter == 501 && old.doorsplitter != 501 && current.missionNumber == 19 && vars.split == 114)
        ||
        (current.doorsplitter == 507 && old.doorsplitter == 501 && current.missionNumber == 19 && vars.split == 115)
        ||
        (current.doorsplitter == 501 && old.doorsplitter == 507 && current.missionNumber == 19 && vars.split == 116)
        ||
        (current.doorsplitter == 503 && old.doorsplitter == 501 && current.missionNumber == 19 && vars.split == 117)
        ||
        (current.doorsplitter == 501 && old.doorsplitter == 503 && current.missionNumber == 19 && vars.split == 118)
        ||
        (current.doorsplitter == 504 && old.doorsplitter == 501 && current.missionNumber == 19 && vars.split == 119)
        ||
        (current.doorsplitter == 501 && old.doorsplitter == 504 && current.missionNumber == 19 && vars.split == 120)
        ||
        (current.doorsplitter == 505 && old.doorsplitter == 501 && current.missionNumber == 19 && vars.split == 121)
        ||
        (current.doorsplitter == 501 && old.doorsplitter == 505 && current.missionNumber == 19 && vars.split == 122)
        ||
        (current.doorsplitter == 506 && old.doorsplitter == 501 && current.missionNumber == 19 && vars.split == 123)
        ||
        (current.doorsplitter == 501 && old.doorsplitter == 506 && current.missionNumber == 19 && vars.split == 124)){
            vars.split++;
            return true;
        }
    }


    //Dante & Nero Doorsplits
    if(settings["DN"] && settings["Chapter 1-20DN/V/LT"]){
        if((old.missionNumber < current.missionNumber)                                                                 
        ||
        //Chapter 2
        (current.doorsplitter  == 2 && old.doorsplitter != 2 && current.missionNumber == 2 && vars.split == 0)
        ||
        (current.doorsplitter == 4 && old.doorsplitter == 2 && current.missionNumber == 2 && vars.split == 1)
        ||
        (current.doorsplitter == 3 && old.doorsplitter == 4 && current.missionNumber == 2 && vars.split == 2)
        ||
        (current.doorsplitter == 4 && old.doorsplitter == 3 && current.missionNumber == 2 && vars.split == 3)
        ||
        (current.doorsplitter == 5 && old.doorsplitter == 4 && current.missionNumber == 2 && vars.split == 4)
        ||
        (current.doorsplitter == 6 && old.doorsplitter == 5 && current.missionNumber == 2 && vars.split == 5)
        ||
        (current.doorsplitter == 7 && old.doorsplitter == 6 && current.missionNumber == 2 && vars.split == 6)
        ||
        (current.doorsplitter == 6 && old.doorsplitter == 7 && current.missionNumber == 2 && vars.split == 7)
        ||
        (current.doorsplitter == 7 && old.doorsplitter == 6 && current.missionNumber == 2 && vars.split == 8)
        ||
        (current.doorsplitter == 6 && old.doorsplitter == 7 && current.missionNumber == 2 && vars.split == 9)
        ||
        (current.doorsplitter == 8 && old.doorsplitter == 6 && current.missionNumber == 2 && vars.split == 10)
        ||
        (current.doorsplitter == 9 && old.doorsplitter == 8 && current.missionNumber == 2 && vars.split == 11)
        ||
        //Chapter 3
        (current.doorsplitter == 105 && old.doorsplitter != 105 && current.missionNumber == 3 && vars.split == 12)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 105 && current.missionNumber == 3 && vars.split == 13)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 200 && current.missionNumber == 3 && vars.split == 14)
        ||
        (current.doorsplitter == 203 && old.doorsplitter == 201 && current.missionNumber == 3 && vars.split == 15)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 203 && current.missionNumber == 3 && vars.split == 16)
        ||
        (current.doorsplitter == 204 && old.doorsplitter == 200 && current.missionNumber == 3 && vars.split == 17)
        ||
        (current.doorsplitter == 205 && old.doorsplitter == 204 && current.missionNumber == 3 && vars.split == 18)
        ||
        (current.doorsplitter == 204 && old.doorsplitter == 205 && current.missionNumber == 3 && vars.split == 19)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 204 && current.missionNumber == 3 && vars.split == 20)
        ||
        (current.doorsplitter == 206 && old.doorsplitter == 200 && current.missionNumber == 3 && vars.split == 21)
        ||
        (current.doorsplitter == 207 && old.doorsplitter == 206 && current.missionNumber == 3 && vars.split == 22)
        ||
        //Chapter 4
        (current.doorsplitter == 206 && old.doorsplitter != 206 && current.missionNumber == 4 && vars.split == 23)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 206 && current.missionNumber == 4 && vars.split == 24)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 200 && current.missionNumber == 4 && vars.split == 25)
        ||
        (current.doorsplitter == 202 && old.doorsplitter == 201 && current.missionNumber == 4 && vars.split == 26)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 202 && current.missionNumber == 4 && vars.split == 27)
        ||
        (current.doorsplitter == 204 && old.doorsplitter == 201 && current.missionNumber == 4 && vars.split == 28)
        ||
        //Chapter 5
        (current.doorsplitter == 210 && old.doorsplitter != 210 && current.missionNumber == 5 && vars.split == 29)
        ||
        (current.doorsplitter == 203 && old.doorsplitter == 210 && current.missionNumber == 5 && vars.split == 30)
        ||
        (current.doorsplitter == 211 && old.doorsplitter == 203 && current.missionNumber == 5 && vars.split == 31)
        ||
        (current.doorsplitter == 203 && old.doorsplitter == 211 && current.missionNumber == 5 && vars.split == 32)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 203 && current.missionNumber == 5 && vars.split == 33)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 201 && current.missionNumber == 5 && vars.split == 34)
        ||
        (current.doorsplitter == 212 && old.doorsplitter == 200 && current.missionNumber == 5 && vars.split == 35)
        ||
        //Chapter 6
        (current.doorsplitter == 213 && old.doorsplitter != 213 && current.missionNumber == 6 && vars.split == 36)
        ||
        (current.doorsplitter == 214 && old.doorsplitter == 213 && current.missionNumber == 6 && vars.split == 37)
        ||
        (current.doorsplitter == 215 && old.doorsplitter == 214 && current.missionNumber == 6 && vars.split == 38)
        ||
        (current.doorsplitter == 217 && old.doorsplitter == 215 && current.missionNumber == 6 && vars.split == 39)
        ||
        (current.doorsplitter == 216 && old.doorsplitter == 217 && current.missionNumber == 6 && vars.split == 40)
        ||
        (current.doorsplitter == 212 && old.doorsplitter == 216 && current.missionNumber == 6 && vars.split == 41)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 212 && current.missionNumber == 6 && vars.split == 42)
        ||
        (current.doorsplitter == 204 && old.doorsplitter == 200 && current.missionNumber == 6 && vars.split == 43)
        ||
        (current.doorsplitter == 205 && old.doorsplitter == 204 && current.missionNumber == 6 && vars.split == 44)
        ||
        (current.doorsplitter == 300 && old.doorsplitter == 205 && current.missionNumber == 6 && vars.split == 45)
        ||
        //Chapter 7
        (current.doorsplitter == 301 && old.doorsplitter != 301 && current.missionNumber == 7 && vars.split == 46)
        ||
        (old.doorsplitter == 301 && current.doorsplitter == 302 && current.missionNumber == 7 && vars.split == 47)
        ||
        (old.doorsplitter == 302 && current.doorsplitter == 303 && current.missionNumber == 7 && vars.split == 48)
        ||
        (old.doorsplitter == 303 && current.doorsplitter == 305 && current.missionNumber == 7) && vars.split == 49
        ||
        (old.doorsplitter == 305 && current.doorsplitter == 306 && current.missionNumber == 7 && vars.split == 50)
        ||
        (old.doorsplitter == 306 && current.doorsplitter == 301 && current.missionNumber == 7 && vars.split == 51)
        ||
        (old.doorsplitter == 301 && current.doorsplitter == 303 && current.missionNumber == 7 && vars.split == 52)
        ||
        (old.doorsplitter == 303 && current.doorsplitter == 308 && current.missionNumber == 7 && vars.split == 53)
        ||
        (old.doorsplitter == 308 && current.doorsplitter == 307 && current.missionNumber == 7 && vars.split == 54)
        ||
        //Chapter 8
        (current.doorsplitter == 305 && old.doorsplitter != 305 && current.missionNumber == 8 && vars.split == 55)
        ||
        (current.doorsplitter == 306 && old.doorsplitter == 305 && current.missionNumber == 8 && vars.split == 56)
        ||
        (current.doorsplitter == 301 && old.doorsplitter == 306 && current.missionNumber == 8 && vars.split == 57)
        ||
        (current.doorsplitter == 302 && old.doorsplitter == 301 && current.missionNumber == 8 && vars.split == 58)
        ||
        (current.doorsplitter == 311 && old.doorsplitter == 302 && current.missionNumber == 8 && vars.split == 59)
        ||
        (current.doorsplitter == 308 && old.doorsplitter == 311 && current.missionNumber == 8 && vars.split == 60)
        ||
        (current.doorsplitter == 304 && old.doorsplitter == 308 && current.missionNumber == 8 && vars.split == 61)
        ||
        (current.doorsplitter == 400 && old.doorsplitter == 304 && current.missionNumber == 8 && vars.split == 62)
        ||
        //Chapter 9
        (current.doorsplitter == 401 && old.doorsplitter != 401 && current.missionNumber == 9 && vars.split == 63)
        ||
        (current.doorsplitter == 402 && old.doorsplitter == 401 && current.missionNumber == 9 && vars.split == 64)
        ||
        (current.doorsplitter == 403 && old.doorsplitter == 402 && current.missionNumber == 9 && vars.split == 65)
        ||
        (current.doorsplitter == 404 && old.doorsplitter == 403 && current.missionNumber == 9 && vars.split == 66)
        ||
        //Chapter 10
        (current.doorsplitter == 403 && old.doorsplitter != 403 && current.missionNumber == 10 && vars.split == 67)
        ||
        (current.doorsplitter == 402 && old.doorsplitter == 403 && current.missionNumber == 10 && vars.split == 68)
        ||
        (current.doorsplitter == 401 && old.doorsplitter == 402 && current.missionNumber == 10 && vars.split == 69)
        ||
        (current.doorsplitter == 405 && old.doorsplitter == 401 && current.missionNumber == 10 && vars.split == 70)
        ||
        (current.doorsplitter == 406 && old.doorsplitter == 405 && current.missionNumber == 10 && vars.split == 71)
        ||
        (current.doorsplitter == 407 && old.doorsplitter == 406 && current.missionNumber == 10 && vars.split == 72)
        ||
        (current.doorsplitter == 408 && old.doorsplitter == 407 && current.missionNumber == 10 && vars.split == 73)
        ||
        //Chapter 12
        (current.doorsplitter == 407 && old.doorsplitter != 407 && current.missionNumber == 12 && vars.split == 74)
        ||
        (current.doorsplitter == 406 && old.doorsplitter == 407 && current.missionNumber == 12 && vars.split == 75)
        ||
        (current.doorsplitter == 405 && old.doorsplitter == 406 && current.missionNumber == 12 && vars.split == 76)
        ||
        (current.doorsplitter == 401 && old.doorsplitter == 405 && current.missionNumber == 12 && vars.split == 77)
        ||
        (current.doorsplitter == 400 && old.doorsplitter == 401 && current.missionNumber == 12 && vars.split == 78)
        ||
        //Chapter 13
        (current.doorsplitter == 304 && old.doorsplitter != 304 && current.missionNumber == 13  && vars.split == 79)
        ||
        (current.doorsplitter == 308 && old.doorsplitter == 304 && current.missionNumber == 13 && vars.split == 80)
        ||
        (current.doorsplitter == 301 && old.doorsplitter == 308 && current.missionNumber == 13 && vars.split == 81)
        ||
        (current.doorsplitter == 306 && old.doorsplitter == 301 && current.missionNumber == 13 && vars.split == 82)
        ||
        (current.doorsplitter == 305 && old.doorsplitter == 306 && current.missionNumber == 13 && vars.split == 83)
        ||
        (current.doorsplitter == 301 && old.doorsplitter == 305 && current.missionNumber == 13 && vars.split == 84)
        ||
        (current.doorsplitter == 302 && old.doorsplitter == 301 && current.missionNumber == 13 && vars.split == 85)
        ||
        (current.doorsplitter == 311 && old.doorsplitter == 302 && current.missionNumber == 13 && vars.split == 86)
        ||
        (current.doorsplitter == 308 && old.doorsplitter == 311 && current.missionNumber == 13 && vars.split == 87)
        ||
        (current.doorsplitter == 307 && old.doorsplitter == 308 && current.missionNumber == 13 && vars.split == 88)
        ||
        //Chapter 14
        (current.doorsplitter == 305 && old.doorsplitter != 305 && current.missionNumber == 14 && vars.split == 89)
        ||
        (old.doorsplitter == 305 && current.doorsplitter == 306 && current.missionNumber == 14 && vars.split == 90)
        ||
        (old.doorsplitter == 306 && current.doorsplitter == 301 && current.missionNumber == 14 && vars.split == 91)
        ||
        (old.doorsplitter == 301 && current.doorsplitter == 300 && current.missionNumber == 14 && vars.split == 92)
        ||
        (old.doorsplitter == 300 && current.doorsplitter == 205 && current.missionNumber == 14 && vars.split == 93)
        ||
        //Chapter 15
        (current.doorsplitter == 204 && old.doorsplitter != 204 && current.missionNumber == 15 && vars.split == 94)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 204 && current.missionNumber == 15 && vars.split == 95)
        ||
        (current.doorsplitter == 206 && old.doorsplitter == 200 && current.missionNumber == 15 && vars.split == 96)
        ||
        (current.doorsplitter == 207 && old.doorsplitter == 206 && current.missionNumber == 15 && vars.split == 97)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 207 && current.missionNumber == 15 && vars.split == 98)
        ||
        (current.doorsplitter == 202 && old.doorsplitter == 201 && current.missionNumber == 15 && vars.split == 99)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 202 && current.missionNumber == 15 && vars.split == 100)
        ||
        (current.doorsplitter == 203 && old.doorsplitter == 201 && current.missionNumber == 15 && vars.split == 101)
        ||
        (current.doorsplitter == 210 && old.doorsplitter == 203 && current.missionNumber == 15 && vars.split == 102)
        ||
        (current.doorsplitter == 209 && old.doorsplitter == 210 && current.missionNumber == 15 && vars.split == 103)
        ||
        (current.doorsplitter == 204 && old.doorsplitter == 209 && current.missionNumber == 15 && vars.split == 104)
        ||
        //Chapter 16
        (current.doorsplitter == 200 && old.doorsplitter != 200 && current.missionNumber == 16 && vars.split == 105)
        ||
        (current.doorsplitter == 105 && old.doorsplitter == 200 && current.missionNumber == 16 && vars.split == 106)
        ||
        (current.doorsplitter == 100 && old.doorsplitter == 105 && current.missionNumber == 16 && vars.split == 107)
        ||
        (current.doorsplitter == 9 && old.doorsplitter == 100 && current.missionNumber == 16 && vars.split == 108)
        ||
        //Chapter 17
        (current.doorsplitter == 6 && old.doorsplitter != 6 && current.missionNumber == 17 && vars.split == 109)
        ||
        (current.doorsplitter == 5 && old.doorsplitter == 6 && current.missionNumber == 17 && vars.split == 110)
        ||
        (current.doorsplitter == 12 && old.doorsplitter == 5 && current.missionNumber == 17 && vars.split == 111)
        ||
        (current.doorsplitter == 11 && old.doorsplitter == 12 && current.missionNumber == 17 && vars.split == 112)
        ||
        (current.doorsplitter == 10 && old.doorsplitter == 11 && current.missionNumber == 17 && vars.split == 113)
        ||
        //Chapter 19
        (current.doorsplitter == 501 && old.doorsplitter != 501 && current.missionNumber == 19 && vars.split == 114)
        ||
        (current.doorsplitter == 507 && old.doorsplitter == 501 && current.missionNumber == 19 && vars.split == 115)
        ||
        (current.doorsplitter == 501 && old.doorsplitter == 507 && current.missionNumber == 19 && vars.split == 116)
        ||
        (current.doorsplitter == 503 && old.doorsplitter == 501 && current.missionNumber == 19 && vars.split == 117)
        ||
        (current.doorsplitter == 501 && old.doorsplitter == 503 && current.missionNumber == 19 && vars.split == 118)
        ||
        (current.doorsplitter == 504 && old.doorsplitter == 501 && current.missionNumber == 19 && vars.split == 119)
        ||
        (current.doorsplitter == 501 && old.doorsplitter == 504 && current.missionNumber == 19 && vars.split == 120)
        ||
        (current.doorsplitter == 505 && old.doorsplitter == 501 && current.missionNumber == 19 && vars.split == 121)
        ||
        (current.doorsplitter == 501 && old.doorsplitter == 505 && current.missionNumber == 19 && vars.split == 122)
        ||
        (current.doorsplitter == 506 && old.doorsplitter == 501 && current.missionNumber == 19 && vars.split == 123)
        ||
        (current.doorsplitter == 501 && old.doorsplitter == 506 && current.missionNumber == 19 && vars.split == 124)
        ||
        //Chapter 20
        (current.doorsplitter == 13 && old.doorsplitter != 13 && current.missionNumber == 20 && vars.split == 125)){
            vars.split++;
            return true;
        }
    }


    //Lady & Trish Doorsplits
    if(settings["LT"] && settings["Chapter 1-20DN/V/LT"]){
        if((old.missionNumber < current.missionNumber)                                                                 
        ||
        //Chapter 2
        (current.doorsplitter  == 2 && old.doorsplitter != 2 && current.missionNumber == 2 && vars.split == 0)
        ||
        (current.doorsplitter == 4 && old.doorsplitter == 2 && current.missionNumber == 2 && vars.split == 1)
        ||
        (current.doorsplitter == 3 && old.doorsplitter == 4 && current.missionNumber == 2 && vars.split == 2)
        ||
        (current.doorsplitter == 4 && old.doorsplitter == 3 && current.missionNumber == 2 && vars.split == 3)
        ||
        (current.doorsplitter == 5 && old.doorsplitter == 4 && current.missionNumber == 2 && vars.split == 4)
        ||
        (current.doorsplitter == 6 && old.doorsplitter == 5 && current.missionNumber == 2 && vars.split == 5)
        ||
        (current.doorsplitter == 7 && old.doorsplitter == 6 && current.missionNumber == 2 && vars.split == 6)
        ||
        (current.doorsplitter == 6 && old.doorsplitter == 7 && current.missionNumber == 2 && vars.split == 7)
        ||
        (current.doorsplitter == 7 && old.doorsplitter == 6 && current.missionNumber == 2 && vars.split == 8)
        ||
        (current.doorsplitter == 6 && old.doorsplitter == 7 && current.missionNumber == 2 && vars.split == 9)
        ||
        (current.doorsplitter == 8 && old.doorsplitter == 6 && current.missionNumber == 2 && vars.split == 10)
        ||
        (current.doorsplitter == 9 && old.doorsplitter == 8 && current.missionNumber == 2 && vars.split == 11)
        ||
        //Chapter 3
        (current.doorsplitter == 105 && old.doorsplitter != 105 && current.missionNumber == 3 && vars.split == 12)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 105 && current.missionNumber == 3 && vars.split == 13)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 200 && current.missionNumber == 3 && vars.split == 14)
        ||
        (current.doorsplitter == 203 && old.doorsplitter == 201 && current.missionNumber == 3 && vars.split == 15)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 203 && current.missionNumber == 3 && vars.split == 16)
        ||
        (current.doorsplitter == 204 && old.doorsplitter == 200 && current.missionNumber == 3 && vars.split == 17)
        ||
        (current.doorsplitter == 205 && old.doorsplitter == 204 && current.missionNumber == 3 && vars.split == 18)
        ||
        (current.doorsplitter == 204 && old.doorsplitter == 205 && current.missionNumber == 3 && vars.split == 19)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 204 && current.missionNumber == 3 && vars.split == 20)
        ||
        (current.doorsplitter == 206 && old.doorsplitter == 200 && current.missionNumber == 3 && vars.split == 21)
        ||
        (current.doorsplitter == 207 && old.doorsplitter == 206 && current.missionNumber == 3 && vars.split == 22)
        ||
        //Chapter 4
        (current.doorsplitter == 206 && old.doorsplitter != 206 && current.missionNumber == 4 && vars.split == 23)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 206 && current.missionNumber == 4 && vars.split == 24)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 200 && current.missionNumber == 4 && vars.split == 25)
        ||
        (current.doorsplitter == 202 && old.doorsplitter == 201 && current.missionNumber == 4 && vars.split == 26)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 202 && current.missionNumber == 4 && vars.split == 27)
        ||
        (current.doorsplitter == 204 && old.doorsplitter == 201 && current.missionNumber == 4 && vars.split == 28)
        ||
        //Chapter 5
        (current.doorsplitter == 210 && old.doorsplitter != 210 && current.missionNumber == 5 && vars.split == 29)
        ||
        (current.doorsplitter == 203 && old.doorsplitter == 210 && current.missionNumber == 5 && vars.split == 30)
        ||
        (current.doorsplitter == 211 && old.doorsplitter == 203 && current.missionNumber == 5 && vars.split == 31)
        ||
        (current.doorsplitter == 203 && old.doorsplitter == 211 && current.missionNumber == 5 && vars.split == 32)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 203 && current.missionNumber == 5 && vars.split == 33)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 201 && current.missionNumber == 5 && vars.split == 34)
        ||
        (current.doorsplitter == 212 && old.doorsplitter == 200 && current.missionNumber == 5 && vars.split == 35)
        ||
        //Chapter 6
        (current.doorsplitter == 213 && old.doorsplitter != 213 && current.missionNumber == 6 && vars.split == 36)
        ||
        (current.doorsplitter == 214 && old.doorsplitter == 213 && current.missionNumber == 6 && vars.split == 37)
        ||
        (current.doorsplitter == 215 && old.doorsplitter == 214 && current.missionNumber == 6 && vars.split == 38)
        ||
        (current.doorsplitter == 217 && old.doorsplitter == 215 && current.missionNumber == 6 && vars.split == 39)
        ||
        (current.doorsplitter == 216 && old.doorsplitter == 217 && current.missionNumber == 6 && vars.split == 40)
        ||
        (current.doorsplitter == 212 && old.doorsplitter == 216 && current.missionNumber == 6 && vars.split == 41)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 212 && current.missionNumber == 6 && vars.split == 42)
        ||
        (current.doorsplitter == 204 && old.doorsplitter == 200 && current.missionNumber == 6 && vars.split == 43)
        ||
        (current.doorsplitter == 205 && old.doorsplitter == 204 && current.missionNumber == 6 && vars.split == 44)
        ||
        (current.doorsplitter == 300 && old.doorsplitter == 205 && current.missionNumber == 6 && vars.split == 45)
        ||
        //Chapter 7
        (current.doorsplitter == 301 && old.doorsplitter != 301 && current.missionNumber == 7 && vars.split == 46)
        ||
        (old.doorsplitter == 301 && current.doorsplitter == 302 && current.missionNumber == 7 && vars.split == 47)
        ||
        (old.doorsplitter == 302 && current.doorsplitter == 303 && current.missionNumber == 7 && vars.split == 48)
        ||
        (old.doorsplitter == 303 && current.doorsplitter == 305 && current.missionNumber == 7) && vars.split == 49
        ||
        (old.doorsplitter == 305 && current.doorsplitter == 306 && current.missionNumber == 7 && vars.split == 50)
        ||
        (old.doorsplitter == 306 && current.doorsplitter == 301 && current.missionNumber == 7 && vars.split == 51)
        ||
        (old.doorsplitter == 301 && current.doorsplitter == 303 && current.missionNumber == 7 && vars.split == 52)
        ||
        (old.doorsplitter == 303 && current.doorsplitter == 308 && current.missionNumber == 7 && vars.split == 53)
        ||
        (old.doorsplitter == 308 && current.doorsplitter == 307 && current.missionNumber == 7 && vars.split == 54)
        ||
        //Chapter 8
        (current.doorsplitter == 305 && old.doorsplitter != 305 && current.missionNumber == 8 && vars.split == 55)
        ||
        (current.doorsplitter == 306 && old.doorsplitter == 305 && current.missionNumber == 8 && vars.split == 56)
        ||
        (current.doorsplitter == 301 && old.doorsplitter == 306 && current.missionNumber == 8 && vars.split == 57)
        ||
        (current.doorsplitter == 302 && old.doorsplitter == 301 && current.missionNumber == 8 && vars.split == 58)
        ||
        (current.doorsplitter == 311 && old.doorsplitter == 302 && current.missionNumber == 8 && vars.split == 59)
        ||
        (current.doorsplitter == 308 && old.doorsplitter == 311 && current.missionNumber == 8 && vars.split == 60)
        ||
        (current.doorsplitter == 304 && old.doorsplitter == 308 && current.missionNumber == 8 && vars.split == 61)
        ||
        (current.doorsplitter == 400 && old.doorsplitter == 304 && current.missionNumber == 8 && vars.split == 62)
        ||
        //Chapter 9
        (current.doorsplitter == 401 && old.doorsplitter != 401 && current.missionNumber == 9 && vars.split == 63)
        ||
        (current.doorsplitter == 402 && old.doorsplitter == 401 && current.missionNumber == 9 && vars.split == 64)
        ||
        (current.doorsplitter == 403 && old.doorsplitter == 402 && current.missionNumber == 9 && vars.split == 65)
        ||
        (current.doorsplitter == 404 && old.doorsplitter == 403 && current.missionNumber == 9 && vars.split == 66)
        ||
        //Chapter 10
        (current.doorsplitter == 403 && old.doorsplitter != 403 && current.missionNumber == 10 && vars.split == 67)
        ||
        (current.doorsplitter == 402 && old.doorsplitter == 403 && current.missionNumber == 10 && vars.split == 68)
        ||
        (current.doorsplitter == 401 && old.doorsplitter == 402 && current.missionNumber == 10 && vars.split == 69)
        ||
        (current.doorsplitter == 405 && old.doorsplitter == 401 && current.missionNumber == 10 && vars.split == 70)
        ||
        (current.doorsplitter == 406 && old.doorsplitter == 405 && current.missionNumber == 10 && vars.split == 71)
        ||
        (current.doorsplitter == 407 && old.doorsplitter == 406 && current.missionNumber == 10 && vars.split == 72)
        ||
        (current.doorsplitter == 408 && old.doorsplitter == 407 && current.missionNumber == 10 && vars.split == 73)
        ||
        //Chapter 12
        (current.doorsplitter == 407 && old.doorsplitter != 407 && current.missionNumber == 12 && vars.split == 74)
        ||
        (current.doorsplitter == 406 && old.doorsplitter == 407 && current.missionNumber == 12 && vars.split == 75)
        ||
        (current.doorsplitter == 405 && old.doorsplitter == 406 && current.missionNumber == 12 && vars.split == 76)
        ||
        (current.doorsplitter == 401 && old.doorsplitter == 405 && current.missionNumber == 12 && vars.split == 77)
        ||
        (current.doorsplitter == 400 && old.doorsplitter == 401 && current.missionNumber == 12 && vars.split == 78)
        ||
        //Chapter 13
        (current.doorsplitter == 304 && old.doorsplitter != 304 && current.missionNumber == 13  && vars.split == 79)
        ||
        (current.doorsplitter == 308 && old.doorsplitter == 304 && current.missionNumber == 13 && vars.split == 80)
        ||
        (current.doorsplitter == 301 && old.doorsplitter == 308 && current.missionNumber == 13 && vars.split == 81)
        ||
        (current.doorsplitter == 306 && old.doorsplitter == 301 && current.missionNumber == 13 && vars.split == 82)
        ||
        (current.doorsplitter == 305 && old.doorsplitter == 306 && current.missionNumber == 13 && vars.split == 83)
        ||
        (current.doorsplitter == 301 && old.doorsplitter == 305 && current.missionNumber == 13 && vars.split == 84)
        ||
        (current.doorsplitter == 302 && old.doorsplitter == 301 && current.missionNumber == 13 && vars.split == 85)
        ||
        (current.doorsplitter == 311 && old.doorsplitter == 302 && current.missionNumber == 13 && vars.split == 86)
        ||
        (current.doorsplitter == 308 && old.doorsplitter == 311 && current.missionNumber == 13 && vars.split == 87)
        ||
        (current.doorsplitter == 307 && old.doorsplitter == 308 && current.missionNumber == 13 && vars.split == 88)
        ||
        //Chapter 14
        (current.doorsplitter == 305 && old.doorsplitter != 305 && current.missionNumber == 14 && vars.split == 89)
        ||
        (old.doorsplitter == 305 && current.doorsplitter == 306 && current.missionNumber == 14 && vars.split == 90)
        ||
        (old.doorsplitter == 306 && current.doorsplitter == 301 && current.missionNumber == 14 && vars.split == 91)
        ||
        (old.doorsplitter == 301 && current.doorsplitter == 300 && current.missionNumber == 14 && vars.split == 92)
        ||
        (old.doorsplitter == 300 && current.doorsplitter == 205 && current.missionNumber == 14 && vars.split == 93)
        ||
        //Chapter 15
        (current.doorsplitter == 204 && old.doorsplitter != 204 && current.missionNumber == 15 && vars.split == 94)
        ||
        (current.doorsplitter == 200 && old.doorsplitter == 204 && current.missionNumber == 15 && vars.split == 95)
        ||
        (current.doorsplitter == 206 && old.doorsplitter == 200 && current.missionNumber == 15 && vars.split == 96)
        ||
        (current.doorsplitter == 207 && old.doorsplitter == 206 && current.missionNumber == 15 && vars.split == 97)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 207 && current.missionNumber == 15 && vars.split == 98)
        ||
        (current.doorsplitter == 202 && old.doorsplitter == 201 && current.missionNumber == 15 && vars.split == 99)
        ||
        (current.doorsplitter == 201 && old.doorsplitter == 202 && current.missionNumber == 15 && vars.split == 100)
        ||
        (current.doorsplitter == 203 && old.doorsplitter == 201 && current.missionNumber == 15 && vars.split == 101)
        ||
        (current.doorsplitter == 211 && old.doorsplitter == 203 && current.missionNumber == 15 && vars.split == 102)
        ||
        (current.doorsplitter == 203 && old.doorsplitter == 211 && current.missionNumber == 15 && vars.split == 103)
        ||
        (current.doorsplitter == 210 && old.doorsplitter == 203 && current.missionNumber == 15 && vars.split == 104)
        ||
        (current.doorsplitter == 209 && old.doorsplitter == 210 && current.missionNumber == 15 && vars.split == 105)
        ||
        (current.doorsplitter == 204 && old.doorsplitter == 209 && current.missionNumber == 15 && vars.split == 106)
        ||
        //Chapter 16
        (current.doorsplitter == 200 && old.doorsplitter != 200 && current.missionNumber == 16 && vars.split == 107)
        ||
        (current.doorsplitter == 105 && old.doorsplitter == 200 && current.missionNumber == 16 && vars.split == 108)
        ||
        (current.doorsplitter == 100 && old.doorsplitter == 105 && current.missionNumber == 16 && vars.split == 109)
        ||
        (current.doorsplitter == 9 && old.doorsplitter == 100 && current.missionNumber == 16 && vars.split == 110)
        ||
        //Chapter 17
        (current.doorsplitter == 6 && old.doorsplitter != 6 && current.missionNumber == 17 && vars.split == 111)
        ||
        (current.doorsplitter == 5 && old.doorsplitter == 6 && current.missionNumber == 17 && vars.split == 112)
        ||
        (current.doorsplitter == 12 && old.doorsplitter == 5 && current.missionNumber == 17 && vars.split == 113)
        ||
        (current.doorsplitter == 11 && old.doorsplitter == 12 && current.missionNumber == 17 && vars.split == 114)
        ||
        (current.doorsplitter == 10 && old.doorsplitter == 11 && current.missionNumber == 17 && vars.split == 115)
        ||
        //Chapter 19
        (current.doorsplitter == 501 && old.doorsplitter != 501 && current.missionNumber == 19 && vars.split == 116)
        ||
        (current.doorsplitter == 507 && old.doorsplitter == 501 && current.missionNumber == 19 && vars.split == 117)
        ||
        (current.doorsplitter == 501 && old.doorsplitter == 507 && current.missionNumber == 19 && vars.split == 118)
        ||
        (current.doorsplitter == 503 && old.doorsplitter == 501 && current.missionNumber == 19 && vars.split == 119)
        ||
        (current.doorsplitter == 501 && old.doorsplitter == 503 && current.missionNumber == 19 && vars.split == 120)
        ||
        (current.doorsplitter == 504 && old.doorsplitter == 501 && current.missionNumber == 19 && vars.split == 121)
        ||
        (current.doorsplitter == 501 && old.doorsplitter == 504 && current.missionNumber == 19 && vars.split == 122)
        ||
        (current.doorsplitter == 505 && old.doorsplitter == 501 && current.missionNumber == 19 && vars.split == 123)
        ||
        (current.doorsplitter == 501 && old.doorsplitter == 505 && current.missionNumber == 19 && vars.split == 124)
        ||
        (current.doorsplitter == 506 && old.doorsplitter == 501 && current.missionNumber == 19 && vars.split == 125)
        ||
        (current.doorsplitter == 501 && old.doorsplitter == 506 && current.missionNumber == 19 && vars.split == 126)){
            vars.split++;
            return true;
        }
    }      


    //BossRush
    if(settings["BossRush"] && old.bloodyPalace < current.bloodyPalace || settings["BossRush"] && current.boss == 16850701 && old.boss != 16850701 && current.bloodyPalace == 101){    //Splitting for BossRush and killing Dante
        vars.rush = (vars.rush + 1);
        if(settings["Berial"] && vars.rush == 1){
            return true;
        }
        if(settings["Bael"] && vars.rush == 2){
            return true;
        }
        if(settings["Echidna"] && vars.rush == 3){
            return true;
        }
        if(settings["Credo"] && vars.rush == 4){
            return true;
        }
        if(settings["Agnus"] && vars.rush == 5){
            return true;
        }
        if(settings["Dante"] && vars.rush == 6){
            return true;
        }

    }

    if(settings["BPS"] && old.bloodyPalace != current.bloodyPalace || settings["BPS"] && current.boss == 16850701 && old.boss != 16850701 && current.bloodyPalace == 101) {            //Splitting for BP Stages and killing Dante
        return true;
    }
}



reset
{
    if ((current.missionNumber < old.missionNumber)                              //Reset for MainGame, when the new Chapter is smaller than the old Chapter
    || 
    (current.MenuOptionNumber == 8 && settings["BossRush"])                     //Reset for BossRush when going to main menu
    || 
    (current.MenuOptionNumber == 8 && settings ["BPS"])                         //Reset for BloodyPalace when going to main menu
    || 
    (current.bloodyPalace < old.bloodyPalace && settings["BossRush"])           //Reset for BossRush when clicking next
    || 
    (current.bloodyPalace < old.bloodyPalace && settings["BPS"])){              //Reset for BloodyPalace when clicking next
        vars.split++;
        return true;
    }
}

