public with sharing class AccountHandler {
    public AccountHandler() {}

    public static void getData(List<Account> acclist, Map<Id, Account> oldMap) {
        Set<Id> accid = new Set<Id>();
        for(Account a : acclist) {
            Account oldAccount = (oldMap != null)? oldMap.get(a.Id):null;
        if(a.Status__c != null && (oldAccount == null || oldAccount.Status__c != a.Status__c)){
        accid.add(a.Id);
        }
    }
    Map<Id, Account> accMap = new Map<Id, Account>([SELECT Id, Status__c,(SELECT Id, Status__c FROM Contacts) FROM Account WHERE Id IN :accid]);
    List<Contact> conlist = new List<Contact>();
    for(Account ac : accMap.values()) {
        for(Contact c : ac.Contacts) {
            Account mymap = accMap.get(ac.Id);
            if(mymap != null) {
                c.Status__c = mymap.Status__c;
                conlist.add(c);
            }
        }
    }
        update conlist;
}
}