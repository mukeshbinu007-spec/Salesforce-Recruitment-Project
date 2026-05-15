trigger InterviewTrigger on Interview__c (after insert, after update) {
    InterviewHandler.getData(Trigger.new);
}

