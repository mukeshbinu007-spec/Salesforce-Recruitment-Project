# Agentforce Opportunity Project

This project demonstrates an Agentforce-ready Apex invocable action for Opportunity records.

## Main File

- `01_AgentforcePracticeAction.cls`

## What It Does

The Apex action accepts an Opportunity Id and returns:

- Stage Name
- Amount
- Close Date

## Salesforce Test Steps

1. Deploy `AgentforcePracticeAction.cls` to your org.
2. Open Salesforce and go to **Opportunities**.
3. Open an Opportunity record and copy the Id from the URL.
4. Test the class from Developer Console using Execute Anonymous.
5. In Agent Builder, add the Apex action named **Get Opportunity details**.

## Execute Anonymous Test

```apex
AgentforcePracticeAction.Request req = new AgentforcePracticeAction.Request();
req.OpportunityId = '006XXXXXXXXXXXXXXX';

List<AgentforcePracticeAction.Request> requests =
    new List<AgentforcePracticeAction.Request>{ req };

List<AgentforcePracticeAction.Result> results =
    AgentforcePracticeAction.getOpportunitydetails(requests);

System.debug('Opportunity result: ' + results);
```

