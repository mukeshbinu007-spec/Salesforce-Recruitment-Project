public with sharing class InterviewHandler {
    public static void getData(List<Interview__c> interviewlist) {
         Set<Id> jobid = new Set<Id>();
        for(Interview__c c : interviewlist) {
            if(c.Job_Application__c != null) {
                jobid.add(c.Job_Application__c);
}
        }
Map<Id, Job_Application__c> jobMap = new Map<Id, Job_Application__c>([SELECT Id, Name, Status__c FROM Job_Application__c WHERE Id IN :jobid]);
for(Interview__c ac : interviewlist) {
Job_Application__c mymap = jobMap.get(ac.Job_Application__c);
if(mymap != null) {
 if(ac.Status__c == 'Selected'){
 mymap.Status__c = 'Hired';
 }
else if(ac.Status__c == 'Rejected'){
 mymap.Status__c = 'Rejected';
}
}
}
update jobMap.values();
    }
    
}
