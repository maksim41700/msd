trigger OpportunityTrigger on Opportunity(before insert, before update) {
    OpportunityHandler handler = new OpportunityHandler(
        Trigger.new,
        Trigger.old,
        Trigger.newMap,
        Trigger.oldMap,
        Trigger.isBefore,
        Trigger.isAfter,
        Trigger.isInsert,
        Trigger.isUpdate
    );
    handler.run();
}
