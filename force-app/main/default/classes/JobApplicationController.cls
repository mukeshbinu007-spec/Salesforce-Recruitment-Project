public with sharing class JobApplicationController {
    @AuraEnabled(cacheable=true)
    public static List<Job_Application__c> getJobApplicationList () {
        return
        [SELECT Id, Name, Status__c FROM Job_Application__c];
    }
}

