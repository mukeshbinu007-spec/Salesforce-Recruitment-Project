public with sharing class AgentPracice1 {
        @InvocableMethod(label='Getcaseinfo' description = 'Request Case From Case object')
            public static List<Result> getcaseinfo (List<Request> request) {
                List<Result> resultlist = new List<Result>();
            
            for(Request req : request) {
                Case c = [SELECT Id, Subject, Description FROM Case WHERE Id= :req.Id];
                Result res = new Result();
                res.Id = c.Id;
                res.Subject = c.Subject;
                res.Description = c.Description;
                resultlist.add(res);
           
            }
        }
    }  
    