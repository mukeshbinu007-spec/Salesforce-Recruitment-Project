@isTest
public class JobApplicationHandlerTest {
    @isTest static void JobApplicationtoUpdate () {
        List<Job_Application__c> joblist = new List<Job_Application__c>();
        Candidate__c ca = new Candidate__c ();
        insert ca;
         Job_Posting__c jp = new Job_Posting__c ();
           insert jp;
        for(integer i=0; i<200; i++) {
            Job_Application__c job = new Job_Application__c();
            job.Candidate__c = ca.Id;
            job.Job_Posting__c = jp.Id;
            
            job.Status__c = 'New';
            job.Rating__c = '5';
            joblist.add(job);   
        }  
        insert joblist;
        List<Interview__c> Interviewlist = new List<Interview__c>();
        for(integer i=0; i<200;i++){
            Interview__c c = new Interview__c ();
            c.Job_Application__c = joblist[i].Id;
            c.Status__c = 'Rejected';
            interviewlist.add(c);
        }
        Test.startTest();
        insert interviewlist;
        Test.stopTest();
        List<Interview__c> result = [SELECT Id, Status__c FROM Interview__c WHERE Id IN :Interviewlist];
        System.assertEquals('Rejected', result[0].Status__c);
    }
}
            
        
            