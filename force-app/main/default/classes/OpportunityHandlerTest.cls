@isTest
public class OpportunityHandlerTest {
    @isTest static void OpptoUpdate () {
        List<Account> acclist = new List<Account>();
        for(integer i=0; i<200;i++) {
            Account a = new Account();
            a.Name = 'Test account';
            acclist.add(a);
        }
            insert acclist;
            List<Opportunity> opplist = new List<Opportunity>();
            for(integer i=0; i<200;i++) {
                Opportunity o = new Opportunity ();
                o.Name = 'New Test';
                o.StageName = 'Prospecting';
                o.CloseDate = system.today();
                o.AccountId = acclist[i].Id;
                opplist.add(o);
            }
            insert opplist;
            Test.startTest();
            for(Opportunity o : opplist) {
                o.StageName = 'Closed Won';
            }
                update opplist;
                Test.stopTest();
                List<Account> result = [SELECT Id, Name, Last_Deal_Won_Date__c FROM Account WHERE Id IN :acclist];
                System.assertEquals(system.today(), result[0].Last_Deal_Won_Date__c);
            }
        }
    
        
    
