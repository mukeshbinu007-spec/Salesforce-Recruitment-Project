public with sharing class ContactHandler {
    public ContactHandler() {}
public static void getData(List<Contact> conlist) {
 Set<Id> accid = new Set<Id>();
  for(Contact c : conlist) {
    if(c.AccountId != null){
    accid.add(c.AccountId);
    }
}
    Map<Id, Account> accMap = new Map<Id, Account>([SELECT Id, Description FROM Account WHERE Id IN :accid]);
    for(Contact ac : conlist) {
        Account mymap =  accMap.get(ac.AccountId);
    mymap.Description = ac.Description;
    }
    update accMap.values();
}
}
