public with sharing class JobApplicationControllerController {
        @AuraEnabled(cacheable=true)
        public static List<Contact> getContactList() {
            return [SELECT Id, Name, LastName FROM Contact];

    }
}
