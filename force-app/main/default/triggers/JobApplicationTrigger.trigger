trigger JobApplicationTrigger on Job_Application__c (after insert) {
    JobApplicationHandler.getData(Trigger.new);
}
