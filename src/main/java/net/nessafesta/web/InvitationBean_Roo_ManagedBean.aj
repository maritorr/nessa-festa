// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.nessafesta.web;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import javax.faces.validator.LongRangeValidator;
import net.nessafesta.domain.Event;
import net.nessafesta.domain.Invitation;
import net.nessafesta.domain.InviteesGroup;
import net.nessafesta.web.InvitationBean;
import net.nessafesta.web.converter.EventConverter;
import net.nessafesta.web.util.MessageFactory;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.inputtextarea.InputTextarea;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.component.spinner.Spinner;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;

privileged aspect InvitationBean_Roo_ManagedBean {
    
    declare @type: InvitationBean: @ManagedBean(name = "invitationBean");
    
    declare @type: InvitationBean: @SessionScoped;
    
    private String InvitationBean.name = "Invitations";
    
    private List<Invitation> InvitationBean.allInvitations;
    
    private boolean InvitationBean.dataVisible = false;
    
    private HtmlPanelGrid InvitationBean.createPanelGrid;
    
    private HtmlPanelGrid InvitationBean.editPanelGrid;
    
    private HtmlPanelGrid InvitationBean.viewPanelGrid;
    
    private boolean InvitationBean.createDialogVisible = false;
    
    private List<InviteesGroup> InvitationBean.selectedInviteeGroups;
    
    public String InvitationBean.getName() {
        return name;
    }
    
    public List<String> InvitationBean.getColumns() {
        return columns;
    }
    
    public List<Invitation> InvitationBean.getAllInvitations() {
        return allInvitations;
    }
    
    public void InvitationBean.setAllInvitations(List<Invitation> allInvitations) {
        this.allInvitations = allInvitations;
    }
    
    public String InvitationBean.findAllInvitations() {
        allInvitations = Invitation.findAllInvitations();
        dataVisible = !allInvitations.isEmpty();
        return null;
    }
    
    public boolean InvitationBean.isDataVisible() {
        return dataVisible;
    }
    
    public void InvitationBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid InvitationBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void InvitationBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid InvitationBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void InvitationBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid InvitationBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void InvitationBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid InvitationBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel titleCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        titleCreateOutput.setFor("titleCreateInput");
        titleCreateOutput.setId("titleCreateOutput");
        titleCreateOutput.setValue("Title:");
        htmlPanelGrid.getChildren().add(titleCreateOutput);
        
        InputText titleCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        titleCreateInput.setId("titleCreateInput");
        titleCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{invitationBean.invitation.title}", String.class));
        titleCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(titleCreateInput);
        
        Message titleCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        titleCreateInputMessage.setId("titleCreateInputMessage");
        titleCreateInputMessage.setFor("titleCreateInput");
        titleCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(titleCreateInputMessage);
        
        OutputLabel numberGuestsCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        numberGuestsCreateOutput.setFor("numberGuestsCreateInput");
        numberGuestsCreateOutput.setId("numberGuestsCreateOutput");
        numberGuestsCreateOutput.setValue("Number Guests:");
        htmlPanelGrid.getChildren().add(numberGuestsCreateOutput);
        
        Spinner numberGuestsCreateInput = (Spinner) application.createComponent(Spinner.COMPONENT_TYPE);
        numberGuestsCreateInput.setId("numberGuestsCreateInput");
        numberGuestsCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{invitationBean.invitation.numberGuests}", Integer.class));
        numberGuestsCreateInput.setRequired(true);
        numberGuestsCreateInput.setMin(1.0);
        LongRangeValidator numberGuestsCreateInputValidator = new LongRangeValidator();
        numberGuestsCreateInputValidator.setMinimum(1);
        numberGuestsCreateInput.addValidator(numberGuestsCreateInputValidator);
        
        htmlPanelGrid.getChildren().add(numberGuestsCreateInput);
        
        Message numberGuestsCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        numberGuestsCreateInputMessage.setId("numberGuestsCreateInputMessage");
        numberGuestsCreateInputMessage.setFor("numberGuestsCreateInput");
        numberGuestsCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(numberGuestsCreateInputMessage);
        
        OutputLabel notesCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        notesCreateOutput.setFor("notesCreateInput");
        notesCreateOutput.setId("notesCreateOutput");
        notesCreateOutput.setValue("Notes:");
        htmlPanelGrid.getChildren().add(notesCreateOutput);
        
        InputTextarea notesCreateInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        notesCreateInput.setId("notesCreateInput");
        notesCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{invitationBean.invitation.notes}", String.class));
        notesCreateInput.setRequired(false);
        htmlPanelGrid.getChildren().add(notesCreateInput);
        
        Message notesCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        notesCreateInputMessage.setId("notesCreateInputMessage");
        notesCreateInputMessage.setFor("notesCreateInput");
        notesCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(notesCreateInputMessage);
        
        OutputLabel eventCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        eventCreateOutput.setFor("eventCreateInput");
        eventCreateOutput.setId("eventCreateOutput");
        eventCreateOutput.setValue("Event:");
        htmlPanelGrid.getChildren().add(eventCreateOutput);
        
        AutoComplete eventCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        eventCreateInput.setId("eventCreateInput");
        eventCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{invitationBean.invitation.event}", Event.class));
        eventCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{invitationBean.completeEvent}", List.class, new Class[] { String.class }));
        eventCreateInput.setDropdown(true);
        eventCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "event", String.class));
        eventCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{event.name} #{event.partyDate} #{event.partySize}", String.class));
        eventCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{event}", Event.class));
        eventCreateInput.setConverter(new EventConverter());
        eventCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(eventCreateInput);
        
        Message eventCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        eventCreateInputMessage.setId("eventCreateInputMessage");
        eventCreateInputMessage.setFor("eventCreateInput");
        eventCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(eventCreateInputMessage);
        
        HtmlOutputText inviteeGroupsCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        inviteeGroupsCreateOutput.setId("inviteeGroupsCreateOutput");
        inviteeGroupsCreateOutput.setValue("Invitee Groups:");
        htmlPanelGrid.getChildren().add(inviteeGroupsCreateOutput);
        
        HtmlOutputText inviteeGroupsCreateInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        inviteeGroupsCreateInput.setId("inviteeGroupsCreateInput");
        inviteeGroupsCreateInput.setValue("This relationship is managed from the InviteesGroup side");
        htmlPanelGrid.getChildren().add(inviteeGroupsCreateInput);
        
        Message inviteeGroupsCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        inviteeGroupsCreateInputMessage.setId("inviteeGroupsCreateInputMessage");
        inviteeGroupsCreateInputMessage.setFor("inviteeGroupsCreateInput");
        inviteeGroupsCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(inviteeGroupsCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid InvitationBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel titleEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        titleEditOutput.setFor("titleEditInput");
        titleEditOutput.setId("titleEditOutput");
        titleEditOutput.setValue("Title:");
        htmlPanelGrid.getChildren().add(titleEditOutput);
        
        InputText titleEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        titleEditInput.setId("titleEditInput");
        titleEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{invitationBean.invitation.title}", String.class));
        titleEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(titleEditInput);
        
        Message titleEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        titleEditInputMessage.setId("titleEditInputMessage");
        titleEditInputMessage.setFor("titleEditInput");
        titleEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(titleEditInputMessage);
        
        OutputLabel numberGuestsEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        numberGuestsEditOutput.setFor("numberGuestsEditInput");
        numberGuestsEditOutput.setId("numberGuestsEditOutput");
        numberGuestsEditOutput.setValue("Number Guests:");
        htmlPanelGrid.getChildren().add(numberGuestsEditOutput);
        
        Spinner numberGuestsEditInput = (Spinner) application.createComponent(Spinner.COMPONENT_TYPE);
        numberGuestsEditInput.setId("numberGuestsEditInput");
        numberGuestsEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{invitationBean.invitation.numberGuests}", Integer.class));
        numberGuestsEditInput.setRequired(true);
        numberGuestsEditInput.setMin(1.0);
        LongRangeValidator numberGuestsEditInputValidator = new LongRangeValidator();
        numberGuestsEditInputValidator.setMinimum(1);
        numberGuestsEditInput.addValidator(numberGuestsEditInputValidator);
        
        htmlPanelGrid.getChildren().add(numberGuestsEditInput);
        
        Message numberGuestsEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        numberGuestsEditInputMessage.setId("numberGuestsEditInputMessage");
        numberGuestsEditInputMessage.setFor("numberGuestsEditInput");
        numberGuestsEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(numberGuestsEditInputMessage);
        
        OutputLabel notesEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        notesEditOutput.setFor("notesEditInput");
        notesEditOutput.setId("notesEditOutput");
        notesEditOutput.setValue("Notes:");
        htmlPanelGrid.getChildren().add(notesEditOutput);
        
        InputTextarea notesEditInput = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        notesEditInput.setId("notesEditInput");
        notesEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{invitationBean.invitation.notes}", String.class));
        notesEditInput.setRequired(false);
        htmlPanelGrid.getChildren().add(notesEditInput);
        
        Message notesEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        notesEditInputMessage.setId("notesEditInputMessage");
        notesEditInputMessage.setFor("notesEditInput");
        notesEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(notesEditInputMessage);
        
        OutputLabel eventEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        eventEditOutput.setFor("eventEditInput");
        eventEditOutput.setId("eventEditOutput");
        eventEditOutput.setValue("Event:");
        htmlPanelGrid.getChildren().add(eventEditOutput);
        
        AutoComplete eventEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        eventEditInput.setId("eventEditInput");
        eventEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{invitationBean.invitation.event}", Event.class));
        eventEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{invitationBean.completeEvent}", List.class, new Class[] { String.class }));
        eventEditInput.setDropdown(true);
        eventEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "event", String.class));
        eventEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{event.name} #{event.partyDate} #{event.partySize}", String.class));
        eventEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{event}", Event.class));
        eventEditInput.setConverter(new EventConverter());
        eventEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(eventEditInput);
        
        Message eventEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        eventEditInputMessage.setId("eventEditInputMessage");
        eventEditInputMessage.setFor("eventEditInput");
        eventEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(eventEditInputMessage);
        
        HtmlOutputText inviteeGroupsEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        inviteeGroupsEditOutput.setId("inviteeGroupsEditOutput");
        inviteeGroupsEditOutput.setValue("Invitee Groups:");
        htmlPanelGrid.getChildren().add(inviteeGroupsEditOutput);
        
        HtmlOutputText inviteeGroupsEditInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        inviteeGroupsEditInput.setId("inviteeGroupsEditInput");
        inviteeGroupsEditInput.setValue("This relationship is managed from the InviteesGroup side");
        htmlPanelGrid.getChildren().add(inviteeGroupsEditInput);
        
        Message inviteeGroupsEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        inviteeGroupsEditInputMessage.setId("inviteeGroupsEditInputMessage");
        inviteeGroupsEditInputMessage.setFor("inviteeGroupsEditInput");
        inviteeGroupsEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(inviteeGroupsEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid InvitationBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText titleLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        titleLabel.setId("titleLabel");
        titleLabel.setValue("Title:");
        htmlPanelGrid.getChildren().add(titleLabel);
        
        HtmlOutputText titleValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        titleValue.setId("titleValue");
        titleValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{invitationBean.invitation.title}", String.class));
        htmlPanelGrid.getChildren().add(titleValue);
        
        HtmlOutputText numberGuestsLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        numberGuestsLabel.setId("numberGuestsLabel");
        numberGuestsLabel.setValue("Number Guests:");
        htmlPanelGrid.getChildren().add(numberGuestsLabel);
        
        HtmlOutputText numberGuestsValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        numberGuestsValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{invitationBean.invitation.numberGuests}", String.class));
        htmlPanelGrid.getChildren().add(numberGuestsValue);
        
        HtmlOutputText notesLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        notesLabel.setId("notesLabel");
        notesLabel.setValue("Notes:");
        htmlPanelGrid.getChildren().add(notesLabel);
        
        InputTextarea notesValue = (InputTextarea) application.createComponent(InputTextarea.COMPONENT_TYPE);
        notesValue.setId("notesValue");
        notesValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{invitationBean.invitation.notes}", String.class));
        notesValue.setReadonly(true);
        notesValue.setDisabled(true);
        htmlPanelGrid.getChildren().add(notesValue);
        
        HtmlOutputText eventLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        eventLabel.setId("eventLabel");
        eventLabel.setValue("Event:");
        htmlPanelGrid.getChildren().add(eventLabel);
        
        HtmlOutputText eventValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        eventValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{invitationBean.invitation.event}", Event.class));
        eventValue.setConverter(new EventConverter());
        htmlPanelGrid.getChildren().add(eventValue);
        
        HtmlOutputText inviteeGroupsLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        inviteeGroupsLabel.setId("inviteeGroupsLabel");
        inviteeGroupsLabel.setValue("Invitee Groups:");
        htmlPanelGrid.getChildren().add(inviteeGroupsLabel);
        
        HtmlOutputText inviteeGroupsValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        inviteeGroupsValue.setId("inviteeGroupsValue");
        inviteeGroupsValue.setValue("This relationship is managed from the InviteesGroup side");
        htmlPanelGrid.getChildren().add(inviteeGroupsValue);
        
        return htmlPanelGrid;
    }
    
    public Invitation InvitationBean.getInvitation() {
        if (invitation == null) {
            invitation = new Invitation();
        }
        return invitation;
    }
    
    public void InvitationBean.setInvitation(Invitation invitation) {
        this.invitation = invitation;
    }
    
    public List<Event> InvitationBean.completeEvent(String query) {
        List<Event> suggestions = new ArrayList<Event>();
        for (Event event : Event.findAllEvents()) {
            String eventStr = String.valueOf(event.getName() +  " "  + event.getPartyDate() +  " "  + event.getPartySize());
            if (eventStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(event);
            }
        }
        return suggestions;
    }
    
    public List<InviteesGroup> InvitationBean.getSelectedInviteeGroups() {
        return selectedInviteeGroups;
    }
    
    public void InvitationBean.setSelectedInviteeGroups(List<InviteesGroup> selectedInviteeGroups) {
        if (selectedInviteeGroups != null) {
            invitation.setInviteeGroups(new HashSet<InviteesGroup>(selectedInviteeGroups));
        }
        this.selectedInviteeGroups = selectedInviteeGroups;
    }
    
    public String InvitationBean.onEdit() {
        if (invitation != null && invitation.getInviteeGroups() != null) {
            selectedInviteeGroups = new ArrayList<InviteesGroup>(invitation.getInviteeGroups());
        }
        return null;
    }
    
    public boolean InvitationBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void InvitationBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String InvitationBean.displayList() {
        createDialogVisible = false;
        findAllInvitations();
        return "invitation";
    }
    
    public String InvitationBean.displayCreateDialog() {
        invitation = new Invitation();
        createDialogVisible = true;
        return "invitation";
    }
    
    public String InvitationBean.persist() {
        String message = "";
        if (invitation.getId() != null) {
            invitation.merge();
            message = "message_successfully_updated";
        } else {
            invitation.persist();
            message = "message_successfully_created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialogWidget.hide()");
        context.execute("editDialogWidget.hide()");
        
        FacesMessage facesMessage = MessageFactory.getMessage(message, "Invitation");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllInvitations();
    }
    
    public String InvitationBean.delete() {
        invitation.remove();
        FacesMessage facesMessage = MessageFactory.getMessage("message_successfully_deleted", "Invitation");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllInvitations();
    }
    
    public void InvitationBean.reset() {
        invitation = null;
        selectedInviteeGroups = null;
        createDialogVisible = false;
    }
    
    public void InvitationBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
