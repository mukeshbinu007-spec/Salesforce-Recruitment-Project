# Interview Project Files

This file is a quick guide for interviewers and reviewers.

The main project in this repository is a Salesforce Recruitment Management project. Some other files in the repository are practice files using standard Salesforce objects like Account, Contact, Case, Lead, and Opportunity.

Please review the files below for the main project.

## Project Name

Salesforce Recruitment Management Project

## Main Custom Objects

- `Job_Application__c`
- `Interview__c`

## Main Apex Automation

### Job Application Automation

File:

`force-app/main/default/classes/JobApplicationHandler.cls`

Purpose:

Creates a related `Interview__c` record when a new `Job_Application__c` record is inserted.

Trigger:

`force-app/main/default/triggers/JobApplicationTrigger.trigger`

## Interview Status Automation

File:

`force-app/main/default/classes/InterviewHandler.cls`

Purpose:

Updates the related `Job_Application__c` status based on the interview result.

Business logic:

- If Interview status is `Selected`, Job Application status becomes `Hired`.
- If Interview status is `Rejected`, Job Application status becomes `Rejected`.

Trigger:

`force-app/main/default/triggers/InterviewTrigger.trigger`

## LWC Files

The Lightning Web Component displays Job Application records and their statuses.

Parent component:

`force-app/main/default/lwc/myParent/`

Child component:

`force-app/main/default/lwc/myChild/`

Apex controller:

`force-app/main/default/classes/JobApplicationController.cls`

## Suggested Review Order

1. `force-app/main/default/triggers/JobApplicationTrigger.trigger`
2. `force-app/main/default/classes/JobApplicationHandler.cls`
3. `force-app/main/default/triggers/InterviewTrigger.trigger`
4. `force-app/main/default/classes/InterviewHandler.cls`
5. `force-app/main/default/classes/JobApplicationController.cls`
6. `force-app/main/default/lwc/myParent/`
7. `force-app/main/default/lwc/myChild/`

## Note About Other Files

Files related to Account, Contact, Case, Lead, and Opportunity are practice examples. They are not the main interview project.

The main project to review is the Recruitment Management functionality using `Job_Application__c` and `Interview__c`.
