void Message_PlayerCrushed(int client, int other) {
    PrintToChatAll("%t%t", PREFIX_COLORED, "Player crushed", client, other);
}

void Message_EnableCrushModeUsage(int client) {
    ReplyToCommand(client, "%s%s", PREFIX, "Usage: sm_playercrush_enable <#userid|name>");
}

void MessageActivity_CrushModeEnabled(int client, const char[] targetName, bool isMultilingual) {
    if (isMultilingual) {
        ShowActivity2(client, PREFIX, "%t", CRUSH_MODE_ENABLED, targetName);
    } else {
        ShowActivity2(client, PREFIX, "%t", CRUSH_MODE_ENABLED, "_s", targetName);
    }
}

void MessageLog_CrushModeEnabled(int client, int target) {
    LogMessage("\"%L\" enabled crush mode for \"%L\"", client, target);
}

void Message_DisableCrushModeUsage(int client) {
    ReplyToCommand(client, "%s%s", PREFIX, "Usage: sm_playercrush_disable <#userid|name>");
}

void MessageActivity_CrushModeDisabled(int client, const char[] targetName, bool isMultilingual) {
    if (isMultilingual) {
        ShowActivity2(client, PREFIX, "%t", CRUSH_MODE_DISABLED, targetName);
    } else {
        ShowActivity2(client, PREFIX, "%t", CRUSH_MODE_DISABLED, "_s", targetName);
    }
}

void MessageLog_CrushModeDisabled(int client, int target) {
    LogMessage("\"%L\" disabled crush mode for \"%L\"", client, target);
}
