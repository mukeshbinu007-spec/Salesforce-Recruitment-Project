@isTest 
public class CaseHandlerTest {
@isTest static void CasetoUpdate() {
    List<Case> caselist = new List<Case>();
    for(integer i=0; i<200; i++) {
        Case c = new Case();
        c.Priority = 'Medium';
        caselist.add(c);
    }
    insert caselist;
    Test.startTest();
    for(Case c: caselist) {
        c.Priority = 'High';
    }
        update caselist;
        List<Task> result = [ SELECT Id, Subject, Status FROM Task WHERE WhatId IN: caselist];
        System.assertEquals('Not Started', result[0].Status);
        System.assertEquals('Priority changed', result[0].Subject);
}
}