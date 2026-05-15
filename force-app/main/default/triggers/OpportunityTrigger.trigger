trigger OpportunityTrigger on Opportunity ( after insert, after update  ) {
     OpportunityHandler.getData(Trigger.new, Trigger.oldMap);

}
