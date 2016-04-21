// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.nessafesta.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import javax.faces.convert.DateTimeConverter;
import javax.faces.validator.LongRangeValidator;
import net.nessafesta.domain.Event;
import net.nessafesta.domain.Invitation;
import net.nessafesta.reference.EventType;
import net.nessafesta.web.EventBean;
import net.nessafesta.web.util.MessageFactory;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.calendar.Calendar;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.component.spinner.Spinner;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;

privileged aspect EventBean_Roo_ManagedBean {
    
    declare @type: EventBean: @ManagedBean(name = "eventBean");
    
    declare @type: EventBean: @SessionScoped;
    
    private String EventBean.name = "Events";
    
    private List<Event> EventBean.allEvents;
    
    private boolean EventBean.dataVisible = false;
    
    private List<String> EventBean.columns;
    
    private HtmlPanelGrid EventBean.createPanelGrid;
    
    private HtmlPanelGrid EventBean.editPanelGrid;
    
    private HtmlPanelGrid EventBean.viewPanelGrid;
    
    private boolean EventBean.createDialogVisible = false;
    
    private List<Invitation> EventBean.selectedInvitations;
    
    @PostConstruct
    public void EventBean.init() {
        columns = new ArrayList<String>();
        columns.add("name");
        columns.add("partyDate");
        columns.add("partySize");
    }
    
    public String EventBean.getName() {
        return name;
    }
    
    public List<String> EventBean.getColumns() {
        return columns;
    }
    
    public List<Event> EventBean.getAllEvents() {
        return allEvents;
    }
    
    public void EventBean.setAllEvents(List<Event> allEvents) {
        this.allEvents = allEvents;
    }
    
    public String EventBean.findAllEvents() {
        allEvents = Event.findAllEvents();
        dataVisible = !allEvents.isEmpty();
        return null;
    }
    
    public boolean EventBean.isDataVisible() {
        return dataVisible;
    }
    
    public void EventBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid EventBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void EventBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid EventBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void EventBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid EventBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void EventBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid EventBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel nameCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        nameCreateOutput.setFor("nameCreateInput");
        nameCreateOutput.setId("nameCreateOutput");
        nameCreateOutput.setValue("Name:");
        htmlPanelGrid.getChildren().add(nameCreateOutput);
        
        InputText nameCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        nameCreateInput.setId("nameCreateInput");
        nameCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.name}", String.class));
        nameCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(nameCreateInput);
        
        Message nameCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nameCreateInputMessage.setId("nameCreateInputMessage");
        nameCreateInputMessage.setFor("nameCreateInput");
        nameCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nameCreateInputMessage);
        
        OutputLabel partyDateCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        partyDateCreateOutput.setFor("partyDateCreateInput");
        partyDateCreateOutput.setId("partyDateCreateOutput");
        partyDateCreateOutput.setValue("Party Date:");
        htmlPanelGrid.getChildren().add(partyDateCreateOutput);
        
        Calendar partyDateCreateInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        partyDateCreateInput.setId("partyDateCreateInput");
        partyDateCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.partyDate}", Date.class));
        partyDateCreateInput.setNavigator(true);
        partyDateCreateInput.setEffect("slideDown");
        partyDateCreateInput.setPattern("dd/MM/yyyy");
        partyDateCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(partyDateCreateInput);
        
        Message partyDateCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        partyDateCreateInputMessage.setId("partyDateCreateInputMessage");
        partyDateCreateInputMessage.setFor("partyDateCreateInput");
        partyDateCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(partyDateCreateInputMessage);
        
        OutputLabel partySizeCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        partySizeCreateOutput.setFor("partySizeCreateInput");
        partySizeCreateOutput.setId("partySizeCreateOutput");
        partySizeCreateOutput.setValue("Party Size:");
        htmlPanelGrid.getChildren().add(partySizeCreateOutput);
        
        Spinner partySizeCreateInput = (Spinner) application.createComponent(Spinner.COMPONENT_TYPE);
        partySizeCreateInput.setId("partySizeCreateInput");
        partySizeCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.partySize}", Long.class));
        partySizeCreateInput.setRequired(true);
        partySizeCreateInput.setMin(1.0);
        LongRangeValidator partySizeCreateInputValidator = new LongRangeValidator();
        partySizeCreateInputValidator.setMinimum(1);
        partySizeCreateInput.addValidator(partySizeCreateInputValidator);
        
        htmlPanelGrid.getChildren().add(partySizeCreateInput);
        
        Message partySizeCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        partySizeCreateInputMessage.setId("partySizeCreateInputMessage");
        partySizeCreateInputMessage.setFor("partySizeCreateInput");
        partySizeCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(partySizeCreateInputMessage);
        
        OutputLabel typeCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        typeCreateOutput.setFor("typeCreateInput");
        typeCreateOutput.setId("typeCreateOutput");
        typeCreateOutput.setValue("Type:");
        htmlPanelGrid.getChildren().add(typeCreateOutput);
        
        AutoComplete typeCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        typeCreateInput.setId("typeCreateInput");
        typeCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.type}", EventType.class));
        typeCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{eventBean.completeType}", List.class, new Class[] { String.class }));
        typeCreateInput.setDropdown(true);
        typeCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(typeCreateInput);
        
        Message typeCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        typeCreateInputMessage.setId("typeCreateInputMessage");
        typeCreateInputMessage.setFor("typeCreateInput");
        typeCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(typeCreateInputMessage);
        
        HtmlOutputText invitationsCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        invitationsCreateOutput.setId("invitationsCreateOutput");
        invitationsCreateOutput.setValue("Invitations:");
        htmlPanelGrid.getChildren().add(invitationsCreateOutput);
        
        HtmlOutputText invitationsCreateInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        invitationsCreateInput.setId("invitationsCreateInput");
        invitationsCreateInput.setValue("This relationship is managed from the Invitation side");
        htmlPanelGrid.getChildren().add(invitationsCreateInput);
        
        Message invitationsCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        invitationsCreateInputMessage.setId("invitationsCreateInputMessage");
        invitationsCreateInputMessage.setFor("invitationsCreateInput");
        invitationsCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(invitationsCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid EventBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel nameEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        nameEditOutput.setFor("nameEditInput");
        nameEditOutput.setId("nameEditOutput");
        nameEditOutput.setValue("Name:");
        htmlPanelGrid.getChildren().add(nameEditOutput);
        
        InputText nameEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        nameEditInput.setId("nameEditInput");
        nameEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.name}", String.class));
        nameEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(nameEditInput);
        
        Message nameEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        nameEditInputMessage.setId("nameEditInputMessage");
        nameEditInputMessage.setFor("nameEditInput");
        nameEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(nameEditInputMessage);
        
        OutputLabel partyDateEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        partyDateEditOutput.setFor("partyDateEditInput");
        partyDateEditOutput.setId("partyDateEditOutput");
        partyDateEditOutput.setValue("Party Date:");
        htmlPanelGrid.getChildren().add(partyDateEditOutput);
        
        Calendar partyDateEditInput = (Calendar) application.createComponent(Calendar.COMPONENT_TYPE);
        partyDateEditInput.setId("partyDateEditInput");
        partyDateEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.partyDate}", Date.class));
        partyDateEditInput.setNavigator(true);
        partyDateEditInput.setEffect("slideDown");
        partyDateEditInput.setPattern("dd/MM/yyyy");
        partyDateEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(partyDateEditInput);
        
        Message partyDateEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        partyDateEditInputMessage.setId("partyDateEditInputMessage");
        partyDateEditInputMessage.setFor("partyDateEditInput");
        partyDateEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(partyDateEditInputMessage);
        
        OutputLabel partySizeEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        partySizeEditOutput.setFor("partySizeEditInput");
        partySizeEditOutput.setId("partySizeEditOutput");
        partySizeEditOutput.setValue("Party Size:");
        htmlPanelGrid.getChildren().add(partySizeEditOutput);
        
        Spinner partySizeEditInput = (Spinner) application.createComponent(Spinner.COMPONENT_TYPE);
        partySizeEditInput.setId("partySizeEditInput");
        partySizeEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.partySize}", Long.class));
        partySizeEditInput.setRequired(true);
        partySizeEditInput.setMin(1.0);
        LongRangeValidator partySizeEditInputValidator = new LongRangeValidator();
        partySizeEditInputValidator.setMinimum(1);
        partySizeEditInput.addValidator(partySizeEditInputValidator);
        
        htmlPanelGrid.getChildren().add(partySizeEditInput);
        
        Message partySizeEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        partySizeEditInputMessage.setId("partySizeEditInputMessage");
        partySizeEditInputMessage.setFor("partySizeEditInput");
        partySizeEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(partySizeEditInputMessage);
        
        OutputLabel typeEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        typeEditOutput.setFor("typeEditInput");
        typeEditOutput.setId("typeEditOutput");
        typeEditOutput.setValue("Type:");
        htmlPanelGrid.getChildren().add(typeEditOutput);
        
        AutoComplete typeEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        typeEditInput.setId("typeEditInput");
        typeEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.type}", EventType.class));
        typeEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{eventBean.completeType}", List.class, new Class[] { String.class }));
        typeEditInput.setDropdown(true);
        typeEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(typeEditInput);
        
        Message typeEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        typeEditInputMessage.setId("typeEditInputMessage");
        typeEditInputMessage.setFor("typeEditInput");
        typeEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(typeEditInputMessage);
        
        HtmlOutputText invitationsEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        invitationsEditOutput.setId("invitationsEditOutput");
        invitationsEditOutput.setValue("Invitations:");
        htmlPanelGrid.getChildren().add(invitationsEditOutput);
        
        HtmlOutputText invitationsEditInput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        invitationsEditInput.setId("invitationsEditInput");
        invitationsEditInput.setValue("This relationship is managed from the Invitation side");
        htmlPanelGrid.getChildren().add(invitationsEditInput);
        
        Message invitationsEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        invitationsEditInputMessage.setId("invitationsEditInputMessage");
        invitationsEditInputMessage.setFor("invitationsEditInput");
        invitationsEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(invitationsEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid EventBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText nameLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nameLabel.setId("nameLabel");
        nameLabel.setValue("Name:");
        htmlPanelGrid.getChildren().add(nameLabel);
        
        HtmlOutputText nameValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        nameValue.setId("nameValue");
        nameValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.name}", String.class));
        htmlPanelGrid.getChildren().add(nameValue);
        
        HtmlOutputText partyDateLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        partyDateLabel.setId("partyDateLabel");
        partyDateLabel.setValue("Party Date:");
        htmlPanelGrid.getChildren().add(partyDateLabel);
        
        HtmlOutputText partyDateValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        partyDateValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.partyDate}", Date.class));
        DateTimeConverter partyDateValueConverter = (DateTimeConverter) application.createConverter(DateTimeConverter.CONVERTER_ID);
        partyDateValueConverter.setPattern("dd/MM/yyyy");
        partyDateValue.setConverter(partyDateValueConverter);
        htmlPanelGrid.getChildren().add(partyDateValue);
        
        HtmlOutputText partySizeLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        partySizeLabel.setId("partySizeLabel");
        partySizeLabel.setValue("Party Size:");
        htmlPanelGrid.getChildren().add(partySizeLabel);
        
        HtmlOutputText partySizeValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        partySizeValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.partySize}", String.class));
        htmlPanelGrid.getChildren().add(partySizeValue);
        
        HtmlOutputText typeLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        typeLabel.setId("typeLabel");
        typeLabel.setValue("Type:");
        htmlPanelGrid.getChildren().add(typeLabel);
        
        HtmlOutputText typeValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        typeValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{eventBean.event.type}", String.class));
        htmlPanelGrid.getChildren().add(typeValue);
        
        HtmlOutputText invitationsLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        invitationsLabel.setId("invitationsLabel");
        invitationsLabel.setValue("Invitations:");
        htmlPanelGrid.getChildren().add(invitationsLabel);
        
        HtmlOutputText invitationsValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        invitationsValue.setId("invitationsValue");
        invitationsValue.setValue("This relationship is managed from the Invitation side");
        htmlPanelGrid.getChildren().add(invitationsValue);
        
        return htmlPanelGrid;
    }
    
    public Event EventBean.getEvent() {
        if (event == null) {
            event = new Event();
        }
        return event;
    }
    
    public void EventBean.setEvent(Event event) {
        this.event = event;
    }
    
    public List<EventType> EventBean.completeType(String query) {
        List<EventType> suggestions = new ArrayList<EventType>();
        for (EventType eventType : EventType.values()) {
            if (eventType.name().toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(eventType);
            }
        }
        return suggestions;
    }
    
    public List<Invitation> EventBean.getSelectedInvitations() {
        return selectedInvitations;
    }
    
    public void EventBean.setSelectedInvitations(List<Invitation> selectedInvitations) {
        if (selectedInvitations != null) {
            event.setInvitations(new HashSet<Invitation>(selectedInvitations));
        }
        this.selectedInvitations = selectedInvitations;
    }
    
    public String EventBean.onEdit() {
        if (event != null && event.getInvitations() != null) {
            selectedInvitations = new ArrayList<Invitation>(event.getInvitations());
        }
        return null;
    }
    
    public boolean EventBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void EventBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String EventBean.displayList() {
        createDialogVisible = false;
        findAllEvents();
        return "event";
    }
    
    public String EventBean.displayCreateDialog() {
        event = new Event();
        createDialogVisible = true;
        return "event";
    }
    
    public String EventBean.persist() {
        String message = "";
        if (event.getId() != null) {
            event.merge();
            message = "message_successfully_updated";
        } else {
            event.persist();
            message = "message_successfully_created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialogWidget.hide()");
        context.execute("editDialogWidget.hide()");
        
        FacesMessage facesMessage = MessageFactory.getMessage(message, "Event");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllEvents();
    }
    
    public String EventBean.delete() {
        event.remove();
        FacesMessage facesMessage = MessageFactory.getMessage("message_successfully_deleted", "Event");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllEvents();
    }
    
    public void EventBean.reset() {
        event = null;
        selectedInvitations = null;
        createDialogVisible = false;
    }
    
    public void EventBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
