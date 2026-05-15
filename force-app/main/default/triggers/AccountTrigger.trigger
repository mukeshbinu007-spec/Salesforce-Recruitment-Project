trigger AccountTrigger on Account ( before delete) {
     AccountHandler.getData(Trigger.old);
}
    