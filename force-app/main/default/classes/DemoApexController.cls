public with sharing class DemoApexController {
 @AuraEnabled (cacheable=true)
 public static List<Account> getAccountlist () {
 return [ SELECT Id, Name, Industry, Phone FROM Account 
 Limit 10];
}
}