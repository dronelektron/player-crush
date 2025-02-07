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

static int g_indices[sizeof(g_crushSounds)];
static int g_currentIndex;

void Sound_Precache() {
    for (int i = 0; i < sizeof(g_crushSounds); i++) {
        PrecacheSound(g_crushSounds[i], PRELOAD_YES);

        g_indices[i] = i;
    }

    g_currentIndex = 0;
}

void Sound_RandomCrush(int client) {
    int index = GetRandomIndex();

    EmitSoundToAll(g_crushSounds[index], client);
}

static int GetRandomIndex() {
    int amount = sizeof(g_crushSounds);
    int current = g_currentIndex;
    int start = current + 1;

    if (start < amount) {
        int end = amount - 1;
        int pivot = GetRandomInt(start, end);

        SwapIndices(current, pivot);

        g_currentIndex++;
    } else {
        g_currentIndex = 0;
    }

    return g_indices[current];
}

static void SwapIndices(int index1, int index2) {
    int temp = g_indices[index1];

    g_indices[index1] = g_indices[index2];
    g_indices[index2] = temp;
}
