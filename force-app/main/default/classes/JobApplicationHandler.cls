public with sharing class JobApplicationHandler {
    public static void getData(List<Job_Application__c> joblist) {
    List<Interview__c>interviewlist = new List<Interview__c>();
        Set<Id> jobid = new Set<Id>();
        for(Job_Application__c job : joblist) {
            if(job.Id != null) { 
                jobid.add(job.Id);
    Interview__c c = new Interview__c ();
    c.Status__c = 'Scheduled';
    c.Job_Application__c = job.Id;
      interviewlist.add(c);    
    }
        }       
    insert interviewlist;
    }  
}
    
     
    




