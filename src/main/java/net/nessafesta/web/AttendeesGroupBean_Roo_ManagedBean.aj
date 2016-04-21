// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.nessafesta.web;

import java.util.ArrayList;
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
import net.nessafesta.domain.AttendeesGroup;
import net.nessafesta.domain.InviteesGroup;
import net.nessafesta.web.AttendeesGroupBean;
import net.nessafesta.web.converter.InviteesGroupConverter;
import net.nessafesta.web.util.MessageFactory;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.component.spinner.Spinner;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;

privileged aspect AttendeesGroupBean_Roo_ManagedBean {
    
    declare @type: AttendeesGroupBean: @ManagedBean(name = "attendeesGroupBean");
    
    declare @type: AttendeesGroupBean: @SessionScoped;
    
    private String AttendeesGroupBean.name = "AttendeesGroups";
    
    private AttendeesGroup AttendeesGroupBean.attendeesGroup;
    
    private List<AttendeesGroup> AttendeesGroupBean.allAttendeesGroups;
    
    private boolean AttendeesGroupBean.dataVisible = false;
    
    private HtmlPanelGrid AttendeesGroupBean.createPanelGrid;
    
    private HtmlPanelGrid AttendeesGroupBean.editPanelGrid;
    
    private HtmlPanelGrid AttendeesGroupBean.viewPanelGrid;
    
    private boolean AttendeesGroupBean.createDialogVisible = false;
    
    public String AttendeesGroupBean.getName() {
        return name;
    }
    
    public List<String> AttendeesGroupBean.getColumns() {
        return columns;
    }
    
    public List<AttendeesGroup> AttendeesGroupBean.getAllAttendeesGroups() {
        return allAttendeesGroups;
    }
    
    public void AttendeesGroupBean.setAllAttendeesGroups(List<AttendeesGroup> allAttendeesGroups) {
        this.allAttendeesGroups = allAttendeesGroups;
    }
    
    public String AttendeesGroupBean.findAllAttendeesGroups() {
        allAttendeesGroups = AttendeesGroup.findAllAttendeesGroups();
        dataVisible = !allAttendeesGroups.isEmpty();
        return null;
    }
    
    public boolean AttendeesGroupBean.isDataVisible() {
        return dataVisible;
    }
    
    public void AttendeesGroupBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid AttendeesGroupBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void AttendeesGroupBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid AttendeesGroupBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void AttendeesGroupBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid AttendeesGroupBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void AttendeesGroupBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid AttendeesGroupBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel attendingCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        attendingCreateOutput.setFor("attendingCreateInput");
        attendingCreateOutput.setId("attendingCreateOutput");
        attendingCreateOutput.setValue("Attending:");
        htmlPanelGrid.getChildren().add(attendingCreateOutput);
        
        Spinner attendingCreateInput = (Spinner) application.createComponent(Spinner.COMPONENT_TYPE);
        attendingCreateInput.setId("attendingCreateInput");
        attendingCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{attendeesGroupBean.attendeesGroup.attending}", Integer.class));
        attendingCreateInput.setRequired(true);
        attendingCreateInput.setMin(0.0);
        LongRangeValidator attendingCreateInputValidator = new LongRangeValidator();
        attendingCreateInputValidator.setMinimum(0);
        attendingCreateInput.addValidator(attendingCreateInputValidator);
        
        htmlPanelGrid.getChildren().add(attendingCreateInput);
        
        Message attendingCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        attendingCreateInputMessage.setId("attendingCreateInputMessage");
        attendingCreateInputMessage.setFor("attendingCreateInput");
        attendingCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(attendingCreateInputMessage);
        
        OutputLabel inviteesGroupCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        inviteesGroupCreateOutput.setFor("inviteesGroupCreateInput");
        inviteesGroupCreateOutput.setId("inviteesGroupCreateOutput");
        inviteesGroupCreateOutput.setValue("Invitees Group:");
        htmlPanelGrid.getChildren().add(inviteesGroupCreateOutput);
        
        AutoComplete inviteesGroupCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        inviteesGroupCreateInput.setId("inviteesGroupCreateInput");
        inviteesGroupCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{attendeesGroupBean.attendeesGroup.inviteesGroup}", InviteesGroup.class));
        inviteesGroupCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{attendeesGroupBean.completeInviteesGroup}", List.class, new Class[] { String.class }));
        inviteesGroupCreateInput.setDropdown(true);
        inviteesGroupCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "inviteesGroup", String.class));
        inviteesGroupCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{inviteesGroup.invited} #{inviteesGroup.id}", String.class));
        inviteesGroupCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{inviteesGroup}", InviteesGroup.class));
        inviteesGroupCreateInput.setConverter(new InviteesGroupConverter());
        inviteesGroupCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(inviteesGroupCreateInput);
        
        Message inviteesGroupCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        inviteesGroupCreateInputMessage.setId("inviteesGroupCreateInputMessage");
        inviteesGroupCreateInputMessage.setFor("inviteesGroupCreateInput");
        inviteesGroupCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(inviteesGroupCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid AttendeesGroupBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel attendingEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        attendingEditOutput.setFor("attendingEditInput");
        attendingEditOutput.setId("attendingEditOutput");
        attendingEditOutput.setValue("Attending:");
        htmlPanelGrid.getChildren().add(attendingEditOutput);
        
        Spinner attendingEditInput = (Spinner) application.createComponent(Spinner.COMPONENT_TYPE);
        attendingEditInput.setId("attendingEditInput");
        attendingEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{attendeesGroupBean.attendeesGroup.attending}", Integer.class));
        attendingEditInput.setRequired(true);
        attendingEditInput.setMin(0.0);
        LongRangeValidator attendingEditInputValidator = new LongRangeValidator();
        attendingEditInputValidator.setMinimum(0);
        attendingEditInput.addValidator(attendingEditInputValidator);
        
        htmlPanelGrid.getChildren().add(attendingEditInput);
        
        Message attendingEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        attendingEditInputMessage.setId("attendingEditInputMessage");
        attendingEditInputMessage.setFor("attendingEditInput");
        attendingEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(attendingEditInputMessage);
        
        OutputLabel inviteesGroupEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        inviteesGroupEditOutput.setFor("inviteesGroupEditInput");
        inviteesGroupEditOutput.setId("inviteesGroupEditOutput");
        inviteesGroupEditOutput.setValue("Invitees Group:");
        htmlPanelGrid.getChildren().add(inviteesGroupEditOutput);
        
        AutoComplete inviteesGroupEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        inviteesGroupEditInput.setId("inviteesGroupEditInput");
        inviteesGroupEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{attendeesGroupBean.attendeesGroup.inviteesGroup}", InviteesGroup.class));
        inviteesGroupEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{attendeesGroupBean.completeInviteesGroup}", List.class, new Class[] { String.class }));
        inviteesGroupEditInput.setDropdown(true);
        inviteesGroupEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "inviteesGroup", String.class));
        inviteesGroupEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{inviteesGroup.invited} #{inviteesGroup.id}", String.class));
        inviteesGroupEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{inviteesGroup}", InviteesGroup.class));
        inviteesGroupEditInput.setConverter(new InviteesGroupConverter());
        inviteesGroupEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(inviteesGroupEditInput);
        
        Message inviteesGroupEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        inviteesGroupEditInputMessage.setId("inviteesGroupEditInputMessage");
        inviteesGroupEditInputMessage.setFor("inviteesGroupEditInput");
        inviteesGroupEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(inviteesGroupEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid AttendeesGroupBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText attendingLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        attendingLabel.setId("attendingLabel");
        attendingLabel.setValue("Attending:");
        htmlPanelGrid.getChildren().add(attendingLabel);
        
        HtmlOutputText attendingValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        attendingValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{attendeesGroupBean.attendeesGroup.attending}", String.class));
        htmlPanelGrid.getChildren().add(attendingValue);
        
        HtmlOutputText inviteesGroupLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        inviteesGroupLabel.setId("inviteesGroupLabel");
        inviteesGroupLabel.setValue("Invitees Group:");
        htmlPanelGrid.getChildren().add(inviteesGroupLabel);
        
        HtmlOutputText inviteesGroupValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        inviteesGroupValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{attendeesGroupBean.attendeesGroup.inviteesGroup}", InviteesGroup.class));
        inviteesGroupValue.setConverter(new InviteesGroupConverter());
        htmlPanelGrid.getChildren().add(inviteesGroupValue);
        
        return htmlPanelGrid;
    }
    
    public AttendeesGroup AttendeesGroupBean.getAttendeesGroup() {
        if (attendeesGroup == null) {
            attendeesGroup = new AttendeesGroup();
        }
        return attendeesGroup;
    }
    
    public void AttendeesGroupBean.setAttendeesGroup(AttendeesGroup attendeesGroup) {
        this.attendeesGroup = attendeesGroup;
    }
    
    public List<InviteesGroup> AttendeesGroupBean.completeInviteesGroup(String query) {
        List<InviteesGroup> suggestions = new ArrayList<InviteesGroup>();
        for (InviteesGroup inviteesGroup : InviteesGroup.findAllInviteesGroups()) {
            String inviteesGroupStr = String.valueOf(inviteesGroup.getInvited() +  " "  + inviteesGroup.getId());
            if (inviteesGroupStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(inviteesGroup);
            }
        }
        return suggestions;
    }
    
    public String AttendeesGroupBean.onEdit() {
        return null;
    }
    
    public boolean AttendeesGroupBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void AttendeesGroupBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String AttendeesGroupBean.displayList() {
        createDialogVisible = false;
        findAllAttendeesGroups();
        return "attendeesGroup";
    }
    
    public String AttendeesGroupBean.displayCreateDialog() {
        attendeesGroup = new AttendeesGroup();
        createDialogVisible = true;
        return "attendeesGroup";
    }
    
    public String AttendeesGroupBean.persist() {
        String message = "";
        if (attendeesGroup.getInviteesGroupId() != null) {
            attendeesGroup.merge();
            message = "message_successfully_updated";
        } else {
            attendeesGroup.persist();
            message = "message_successfully_created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialogWidget.hide()");
        context.execute("editDialogWidget.hide()");
        
        FacesMessage facesMessage = MessageFactory.getMessage(message, "AttendeesGroup");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllAttendeesGroups();
    }
    
    public String AttendeesGroupBean.delete() {
        attendeesGroup.remove();
        FacesMessage facesMessage = MessageFactory.getMessage("message_successfully_deleted", "AttendeesGroup");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllAttendeesGroups();
    }
    
    public void AttendeesGroupBean.reset() {
        attendeesGroup = null;
        createDialogVisible = false;
    }
    
    public void AttendeesGroupBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
