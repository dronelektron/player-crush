static char g_crushSounds[][] = {
    "npc/barnacle/barnacle_crunch2.wav",
    "npc/barnacle/barnacle_crunch3.wav",
    "npc/barnacle/neck_snap1.wav",
    "npc/barnacle/neck_snap2.wav"
}

void Sound_Precache() {
    for (int i = 0; i < sizeof(g_crushSounds); i++) {
        PrecacheSound(g_crushSounds[i], PRELOAD_YES);
    }
}

void Sound_RandomCrush(int client) {
    int index = GetRandomInt(0, sizeof(g_crushSounds) - 1);

    EmitSoundToAll(g_crushSounds[index], client);
}
