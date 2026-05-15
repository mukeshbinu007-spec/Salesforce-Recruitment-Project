@isTest 
public class ContactHandlerTest {
@isTest static void ContoUpdate() {
    List<Account> acclist = new List<Account>();
    for(integer i=0;  i<200; i++) {
        Account a = new Account();
        a.Name = 'Test Account';
        a.Description = 'Anything';
        acclist.add(a);
    }
    insert acclist;
    List<Contact> conlist = new List<Contact>();
    for(integer i=0; i<200;i++) {
        Contact c = new Contact();
        c.LastName = 'kumar';
        c.Description = 'Description updated';
        c.AccountId = acclist[i].Id;
        conlist.add(c);
    }
    insert conlist;
    Test.startTest();
    for(Account a : acclist){
    a.Description = 'Description updated';
}
update acclist;
List<Account> result = [SELECT Id, Name, Description FROM Account WHERE Id IN :acclist];
System.assertEquals('Description updated', result[0].Description);
}
}
