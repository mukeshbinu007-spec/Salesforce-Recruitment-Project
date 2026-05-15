public with sharing class OpportunityHandler {
public static void getData(List<Opportunity> opplist, Map<Id, Opportunity> oldMap) {
  Set<Id> accid = new Set<Id>();
  for(Opportunity o : opplist) {
    Opportunity oldOpportunity = if(oldMap != null && oldMap.get(o.Id)!= null);
    if(o.StageName != null && o.StageName != oldOpportunity.StageName){
      accid.add(o.AccountId);
    }
  }
      Map<Id, Account> accMap = new Map<Id, Account>([SELECT Id, Name, StageName FROM Contact WHERE AccountId In :accid]);
      for(Contact c : conlist) {
        Account mymap = accMap.get(a.Id);
        if(mymap != null) {
          if(c.StageName == 'Closed Won') {
            
            mymap.Type = 'Customer';
          }
        }
      }
        update accMap.values();
      }
    }
  
