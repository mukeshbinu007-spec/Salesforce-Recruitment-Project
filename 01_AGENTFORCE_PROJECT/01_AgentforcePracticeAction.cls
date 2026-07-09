public with sharing class AgentforcePracticeAction {
  @InvocableMethod(label='Get Opportunity details' description = 'Request Id From Opportunity')
    public static List<Result> getOpportunitydetails (List<Request> request) {
    List<Result> resultlist= new List<Result>();
    for(Request req : request) {
        Opportunity opp = [SELECT Id, StageName, Amount, CloseDate FROM Opportunity WHERE Id= :req.OpportunityId];
        Result res = new Result();
        res.StageName = opp.StageName;
        res.Amount = opp.Amount;
        res.CloseDate = opp.CloseDate;
        resultlist.add(res);
    }
    return resultlist;
}
    public class Request {
        
        @InvocableVariable(required = true description = 'Get Id FROM Opportunity')
        public Id OpportunityId;
    }
        public class Result {
            @InvocableVariable(description = 'Get StageName FROM Opportunity')
            public String StageName;
            @InvocableVariable(description = 'Get Amount FROM Opportunity')
            public Decimal Amount;
            @InvocableVariable(description = 'Get CloseDate FROM Opportunity')
            public Date closeDate;
        }
    }
