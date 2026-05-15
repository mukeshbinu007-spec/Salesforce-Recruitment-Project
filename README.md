# Salesforce Recruitment Management Project

## Interview Review Guide

For a quick review of my main project files, please start here:

**[INTERVIEW_PROJECT_FILES.md](INTERVIEW_PROJECT_FILES.md)**

This project also contains some Salesforce practice files for standard objects, but the interview project is the Recruitment Management functionality documented in the guide above.

---

This repository contains a Salesforce DX project built to demonstrate Apex automation, triggers, and Lightning Web Components.

The main project is a recruitment management flow where job applications are tracked and interview records are created/updated through Apex trigger logic.

## Main Project Features

- Automatically creates an Interview record when a Job Application is created.
- Updates the Job Application status when an Interview is marked as Selected or Rejected.
- Displays Job Application records in a Lightning Web Component.
- Uses Apex handler classes to keep trigger logic clean and reusable.

## Where to Review My Main Work

### Apex Classes

- `force-app/main/default/classes/JobApplicationHandler.cls`
- `force-app/main/default/classes/InterviewHandler.cls`
- `force-app/main/default/classes/JobApplicationController.cls`

### Apex Triggers

- `force-app/main/default/triggers/JobApplicationTrigger.trigger`
- `force-app/main/default/triggers/InterviewTrigger.trigger`

### Lightning Web Components

- `force-app/main/default/lwc/myParent/`
- `force-app/main/default/lwc/myChild/`

## Main Custom Objects Used

- `Job_Application__c`
- `Interview__c`

## Automation Flow

1. A new `Job_Application__c` record is created.
2. `JobApplicationTrigger` runs after insert.
3. `JobApplicationHandler` creates a related `Interview__c` record with status `Scheduled`.
4. When an `Interview__c` record is inserted or updated, `InterviewTrigger` runs.
5. `InterviewHandler` updates the related Job Application:
   - Interview status `Selected` changes Job Application status to `Hired`.
   - Interview status `Rejected` changes Job Application status to `Rejected`.

## LWC Functionality

The Lightning Web Component reads Job Application records through `JobApplicationController` and displays each application's name and status.

Main files:

- `force-app/main/default/lwc/myParent/myParent.html`
- `force-app/main/default/lwc/myParent/myParent.js`
- `force-app/main/default/lwc/myChild/myChild.html`
- `force-app/main/default/lwc/myChild/myChild.js`

## Other Practice Files

This repository may also contain practice work using standard Salesforce objects such as Account, Contact, Case, Lead, and Opportunity.

Those files are included for learning and practice, but the main interview project to review is the Recruitment Management functionality listed above.

Examples of practice files:

- `force-app/main/default/classes/AccountHandler.cls`
- `force-app/main/default/classes/ContactHandler.cls`
- `force-app/main/default/classes/CaseHandler.cls`
- `force-app/main/default/classes/LeadHandler.cls`
- `force-app/main/default/classes/OpportunityHandler.cls`

## Repository Safety Notes

Local Salesforce authentication and cache folders should not be pushed to GitHub. This project includes `.gitignore` rules for common local-only files:

- `.sf/`
- `.sfdx/`
- `node_modules/`
- `.env`
- logs and cache files

## Suggested Interview Review Path

1. Start with this `README.md`.
2. Review the custom recruitment automation:
   - `JobApplicationTrigger.trigger`
   - `JobApplicationHandler.cls`
   - `InterviewTrigger.trigger`
   - `InterviewHandler.cls`
3. Review the LWC display:
   - `myParent`
   - `myChild`
4. Review the practice standard object files only if extra examples are needed.
