// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.nessafesta.domain;

import java.util.Set;
import net.nessafesta.domain.AttendeesGroup;
import net.nessafesta.domain.Invitation;
import net.nessafesta.domain.InviteesGroup;
import net.nessafesta.reference.GuestType;

privileged aspect InviteesGroup_Roo_JavaBean {
    
    public GuestType InviteesGroup.getGuestType() {
        return this.guestType;
    }
    
    public void InviteesGroup.setGuestType(GuestType guestType) {
        this.guestType = guestType;
    }
    
    public int InviteesGroup.getInvited() {
        return this.invited;
    }
    
    public void InviteesGroup.setInvited(int invited) {
        this.invited = invited;
    }
    
    public Invitation InviteesGroup.getInvitation() {
        return this.invitation;
    }
    
    public void InviteesGroup.setInvitation(Invitation invitation) {
        this.invitation = invitation;
    }
    
    public Set<AttendeesGroup> InviteesGroup.getAttendeeGroups() {
        return this.attendeeGroups;
    }
    
    public void InviteesGroup.setAttendeeGroups(Set<AttendeesGroup> attendeeGroups) {
        this.attendeeGroups = attendeeGroups;
    }
    
}
