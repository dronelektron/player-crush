void Command_Create() {
    RegAdminCmd("sm_playercrush_enable", Command_EnableCrushMode, ADMFLAG_GENERIC);
    RegAdminCmd("sm_playercrush_disable", Command_DisableCrushMode, ADMFLAG_GENERIC);
}

public Action Command_EnableCrushMode(int client, int args) {
    if (args < 1) {
        Message_EnableCrushModeUsage(client);

        return Plugin_Handled;
    }

    char name[MAX_NAME_LENGTH];

    GetCmdArg(1, name, sizeof(name));

    int[] targets = new int[MAXPLAYERS];
    char targetName[MAX_NAME_LENGTH];
    bool isMultilingual;

    int playersAmount = ProcessTargetString(
        name, client, targets, MAXPLAYERS, COMMAND_FILTER_NONE, targetName, sizeof(targetName), isMultilingual
    );

    if (playersAmount <= 0) {
        ReplyToTargetError(client, playersAmount);

        return Plugin_Handled;
    }

    bool enabled = false;

    for (int i = 0; i < playersAmount; i++) {
        int target = targets[i];

        enabled |= UseCase_CrushMode_Enable(client, target);
    }

    if (enabled) {
        MessageActivity_CrushModeEnabled(client, targetName, isMultilingual);
    }

    return Plugin_Handled;
}

public Action Command_DisableCrushMode(int client, int args) {
    if (args < 1) {
        Message_DisableCrushModeUsage(client);

        return Plugin_Handled;
    }

    char name[MAX_NAME_LENGTH];

    GetCmdArg(1, name, sizeof(name));

    int[] targets = new int[MAXPLAYERS];
    char targetName[MAX_NAME_LENGTH];
    bool isMultilingual;

    int playersAmount = ProcessTargetString(
        name, client, targets, MAXPLAYERS, COMMAND_FILTER_NONE, targetName, sizeof(targetName), isMultilingual
    );

    if (playersAmount <= 0) {
        ReplyToTargetError(client, playersAmount);

        return Plugin_Handled;
    }

    bool disabled = false;

    for (int i = 0; i < playersAmount; i++) {
        int target = targets[i];

        disabled |= UseCase_CrushMode_Disable(client, target);
    }

    if (disabled) {
        MessageActivity_CrushModeDisabled(client, targetName, isMultilingual);
    }

    return Plugin_Handled;
}
