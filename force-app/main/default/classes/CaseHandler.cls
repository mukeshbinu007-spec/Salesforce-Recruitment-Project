public with sharing class CaseHandler {
    public CaseHandler() {}
    public static void getData (List<Case> caselist, Map<Id, Case> oldMap) {
        List<Task> tasklist = new List<Task>();
        for(Case c : caselist) {
            Case oldCase = oldMap.get(c.Id);
        if(c.Priority == 'High' && c.Priority != oldCase.Priority) {
        Task t = new Task();
        t.Subject = 'Priority changed';
        t.Status = 'Not Started';
        t.Priority = 'Normal';
        t.WhatId = c.Id;
        tasklist.add(t);
        }
    }
    insert tasklist;
}
}