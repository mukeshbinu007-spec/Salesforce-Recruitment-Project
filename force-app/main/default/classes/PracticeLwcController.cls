public with sharing class PracticeLwcController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getPracticeContacts() {
        return [
            SELECT Id, Name, Email, Phone
            FROM Contact
            ORDER BY LastModifiedDate DESC
            LIMIT 5
        ];
    }
}
