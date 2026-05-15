@isTest 
public class InterviewHandlerTest {
@isTest static void InterviewtoUpdate() {
    List<Job_Application__c> joblist = new List<Job_Application__c>();
    Job_Posting__c jp = new Job_Posting__C ();
    insert jp;
    Candidate__c c = new Candidate__c();
    insert c;
    for(integer i=0; i<200;i++) {
        Job_Application__c job = new Job_Application__c();
        job.Candidate__c = c.Id;
        job.Job_Posting__C = jp.Id;
        job.Status__C = 'New';
        job.Rating__c = '5';
        job.Job_Posting__c = jp.Id;
        job.Candidate__c = c.Id;
        joblist.add(job);
    }
    insert joblist;
    List<Interview__c> Interviewlist = new List<Interview__c>();
    for(integer i=0; i<200; i++) {
        Interview__c inv = new Interview__c();
            inv.Status__c = 'Selected';
            inv.Job_Application__c = joblist[i].Id;
            interviewlist.add(inv);
    }
        Test.startTest();
        insert interviewlist;
        Test.stopTest();
        List<Job_Application__c> result = [SELECT Id, Status__c FROM Job_Application__c WHERE Id IN :joblist];
        system.AssertEquals('Hired', result[0].Status__c);
    }


        @isTest static void negativeInterviewtoUpdate() {
    List<Job_Application__c> joblist = new List<Job_Application__c>();
    Job_Posting__c jp = new Job_Posting__C ();
    insert jp;
    Candidate__c c = new Candidate__c();
    insert c;
    for(integer i=0; i<200;i++) {
        Job_Application__c job = new Job_Application__c();
        job.Candidate__c = c.Id;
        job.Status__C = 'New';
        job.Rating__c = '5';
        job.Job_Posting__c = jp.Id;
        job.Candidate__c = c.Id;
        joblist.add(job);
    }
    insert joblist;
    List<Interview__c> Interviewlist = new List<Interview__c>();
    Job_Application__c j = new Job_Application__c();
    for(integer i=0; i<200;i++) {
        Interview__c inte = new Interview__c();
            inte.Status__c = 'Rejected';
            inte.Job_Application__c = joblist[i].Id;
            interviewlist.add(inte);
        }
        Test.startTest();
        insert interviewlist;
        Test.stopTest();
        List<Job_Application__c> result = [SELECT Id, Status__c FROM Job_Application__c WHERE Id IN :joblist];
        System.assertEquals('Rejected', result[0].Status__c);
    }
}