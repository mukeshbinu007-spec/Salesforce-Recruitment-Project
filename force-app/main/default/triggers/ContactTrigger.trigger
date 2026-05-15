trigger ContactTrigger on Contact (after insert) {
    ContactHandler.getData(Trigger.new);
}
    