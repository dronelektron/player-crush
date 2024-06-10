#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

#include "player-crush/hook"
#include "player-crush/math"
#include "player-crush/message"
#include "player-crush/sound"

#include "modules/hook.sp"
#include "modules/message.sp"
#include "modules/sound.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Player crush",
    author = "Dron-elektron",
    description = "Allows players to crush other players",
    version = "0.1.0",
    url = "https://github.com/dronelektron/player-crush"
};

public void OnPluginStart() {
    LoadTranslations("player-crush.phrases");
}

public void OnMapStart() {
    Sound_Precache();
}

public void OnClientPutInServer(int client) {
    Hook_StartTouchPost(client);
}
