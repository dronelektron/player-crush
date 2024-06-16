static char g_crushSounds[][] = {
    "npc/antlion_grub/squashed.wav",
    "npc/antlion_guard/foot_light2.wav",
    "npc/barnacle/barnacle_crunch2.wav",
    "npc/barnacle/barnacle_crunch3.wav",
    "npc/barnacle/neck_snap1.wav",
    "npc/barnacle/neck_snap2.wav",
    "npc/vort/foot_hit.wav",
    "physics/body/body_medium_break3.wav",
    "physics/body/body_medium_break4.wav"
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
