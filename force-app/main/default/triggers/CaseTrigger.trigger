trigger CaseTrigger on Case ( after update) {
    CaseHandler.getData(Trigger.new, Trigger.oldMap);
}
    