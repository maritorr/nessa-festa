// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.nessafesta.domain;

import net.nessafesta.domain.AttendeesGroup;
import net.nessafesta.domain.InviteesGroup;

privileged aspect AttendeesGroup_Roo_JavaBean {
    
    public Long AttendeesGroup.getInviteesGroupId() {
        return this.inviteesGroupId;
    }
    
    public void AttendeesGroup.setInviteesGroupId(Long inviteesGroupId) {
        this.inviteesGroupId = inviteesGroupId;
    }
    
    public int AttendeesGroup.getAttending() {
        return this.attending;
    }
    
    public void AttendeesGroup.setAttending(int attending) {
        this.attending = attending;
    }
    
    public InviteesGroup AttendeesGroup.getInviteesGroup() {
        return this.inviteesGroup;
    }
    
    public void AttendeesGroup.setInviteesGroup(InviteesGroup inviteesGroup) {
        this.inviteesGroup = inviteesGroup;
    }
    
}