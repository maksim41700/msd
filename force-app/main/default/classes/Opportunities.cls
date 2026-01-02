public with sharing class Opportunities {
    private List<Opportunity> opps = new List<Opportunity>();

    public void setOpportunities(List<Opportunity> opps) {
        this.opps = opps;
    }

    public void setProfile() {
        for (Opportunity opp : this.opps) {
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
