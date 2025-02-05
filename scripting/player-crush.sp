#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

#include "player-crush/math"
#include "player-crush/message"
#include "player-crush/sdk-hook"
#include "player-crush/sound"

#include "modules/message.sp"
#include "modules/native.sp"
#include "modules/sdk-hook.sp"
#include "modules/sound.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Player crush",
    author = "Dron-elektron",
    description = "Allows players to crush other players",
    version = "1.0.1",
    url = "https://github.com/dronelektron/player-crush"
};

public APLRes AskPluginLoad2(Handle plugin, bool late, char[] error, int errorMax) {
    Native_Create();

    return APLRes_Success;
}

public void OnPluginStart() {
    LoadTranslations("player-crush.phrases");
}

public void OnMapStart() {
    Sound_Precache();
}
