public with sharing class OpportunityHandler {
    Opportunities operator = new Opportunities();
    private List<Opportunity> opps;
    private List<Opportunity> oppsOld;
    private Map<Id, Opportunity> oppsById;
    private Map<Id, Opportunity> oppsByIdOld;
    private Boolean isBefore;
    private Boolean isAfter;
    private Boolean isInsert;
    private Boolean isUpdate;

    public OpportunityHandler(
        List<Opportunity> opps,
        List<Opportunity> oppsOld,
        Map<Id, Opportunity> oppsById,
        Map<Id, Opportunity> oppsByIdOld,
        Boolean isBefore,
        Boolean isAfter,
        Boolean isInsert,
        Boolean isUpdate
    ) {
        this.operator = operator;
        this.opps = opps;
        this.oppsOld = oppsOld;
        this.oppsById = oppsById;
        this.oppsByIdOld = oppsByIdOld;
        this.isBefore = isBefore;
        this.isAfter = isAfter;
        this.isInsert = isInsert;
        this.isUpdate = isUpdate;
    }

    public void run() {
        if (this.isBefore) {
            if (this.isInsert) {
                this.handleBeforeInsert();
            } else if (this.isUpdate) {
                this.handleBeforeUpdate();
            }
        } else if (this.isAfter) {
            if (this.isInsert) {
                this.handleAfterInsert();
            } else if (this.isUpdate) {
                this.handleAfterUpdate();
            }
        }
    }

    private void handleBeforeInsert() {
        this.operator.setOpportunities(this.opps);
        this.operator.setProfile();
    }

    private void handleBeforeUpdate() {
        List<Opportunity> oppsToProcess = new List<Opportunity>();
        for (Opportunity opp : this.opps) {
            Opportunity oldOpp = this.oppsByIdOld.get(opp.Id);
            if (opp.Amount != oldOpp.Amount) {
                oppsToProcess.add(opp);
            }
        }
        this.operator.setOpportunities(oppsToProcess);
        this.operator.setProfile();
    }

    private void handleAfterInsert() {
    }

    private void handleAfterUpdate() {
    }

    private void setProfile(List<Opportunity> opps) {
        for (Opportunity opp : opps) {
            if (opp.Amount > 50000) {
                opp.Profile__c = 'High';
            } else if (opp.Amount > 10000) {
                opp.Profile__c = 'Medium';
            } else {
                opp.Profile__c = 'Low';
            }
        }
    }
}
