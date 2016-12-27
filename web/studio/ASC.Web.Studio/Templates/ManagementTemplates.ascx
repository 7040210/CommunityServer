﻿<%@ Control Language="C#" AutoEventWireup="false" EnableViewState="false" %>
<%@ Import Namespace="ASC.Web.Studio.Core.Users" %>
<%@ Import Namespace="Resources" %>
<%@ Import Namespace="ASC.Web.Core.Utility.Skins" %>


<script id="template-productItem" type="text/x-jquery-tmpl">
{{if CanNotBeDisabled === false}}
<div class="tabs-section {{if Disabled === true}} accessRights-disabledText{{/if}}">
    <span class="header-base">
        <img src="{{if Disabled === true}}${DisabledIconUrl}{{else}}${IconUrl}{{/if}}" align="absmiddle" />
        <span>${Name}</span>
    </span> 
    <span id="switcherAccessRights_${ItemName}" data-id="${ItemName}" class="toggle-button"
            data-switcher="0" data-showtext="<%=Resource.Show%>" data-hidetext="<%=Resource.Hide%>">
            <%=Resource.Hide%>
    </span>
</div>

<div id="accessRightsContainer_${ItemName}" data-id="${ID}" class="accessRights-content">
    <div{{if Disabled === true}} style='display:none'{{/if}}>
        <table width="100%" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td width="390px" valign="top">
                        <div>${jq.format(ASC.Resources.Master.AccessRightsAccessToProduct, Name)}:</div>
                        <div class="accessRightsItems">
                            <input type="radio" id="all_${ID}" name="radioList_${ID}"
                             onclick="ASC.Settings.AccessRights.changeAccessType(this, '${ItemName}')">
                            <label for="all_${ID}"><%= CustomNamingPeople.Substitute<Resource>("AccessRightsAllUsers") %></label>
                        </div>
                        <div class="accessRightsItems">
                            <input type="radio" id="fromList_${ID}" name="radioList_${ID}"
                             onclick="ASC.Settings.AccessRights.changeAccessType(this, '${ItemName}')">
                            <label for="fromList_${ID}"><%= CustomNamingPeople.Substitute<Resource>("AccessRightsUsersFromList") %></label>
                        </div>
                    </td>
                    <td valign="top">
                        {{if UserOpportunities != null && UserOpportunities.length > 0}}
                            <div>${UserOpportunitiesLabel}:</div>
                            {{each(i, opp) UserOpportunities}}
                                <div class="simple-marker-list">${Encoder.htmlEncode(opp)}</div>
                            {{/each}}
                        {{/if}}
                    </td>
                </tr>
            </tbody>
        </table>
        <div id="selectorContent_${ItemName}" class="accessRightProductBlock">
            <div id="emptyUserListLabel_${ItemName}" class="describe-text accessRightsEmptyUserList">
                <%= CustomNamingPeople.Substitute<Resource>("AccessRightsEmptyUserList") %>
            </div>
            <div id="selectedUsers_${ItemName}" class="clearFix">
                {{if SelectedUsers != null &&  SelectedUsers.length > 0}}
                    {{each(i, usr) SelectedUsers}}
                        <div class="accessRights-selectedItem" id="selectedUser_${ItemName}_${usr.ID}">
                            <img src="<%= WebImageSupplier.GetAbsoluteWebPath("user_12.png") %>">
                            <img src="<%= WebImageSupplier.GetAbsoluteWebPath("trash_12.png") %>" id="deleteSelectedUserImg_${ItemName}_${usr.ID}"
                                title="<%= Resource.DeleteButton %>" class="display-none">
                            ${usr.DisplayUserName}
                        </div>
                    {{/each}}
                {{/if}}
            </div>
            <div id="selectedGroups_${ItemName}" class="clearFix">

                {{if SelectedGroups != null &&  SelectedGroups.length > 0}}
                    {{each(i, gr) SelectedGroups}}
                        <div class="accessRights-selectedItem" id="selectedGroup_${ItemName}_${gr.ID}">
                            <img src="<%= WebImageSupplier.GetAbsoluteWebPath("group_12.png") %>">
                            <img src="<%= WebImageSupplier.GetAbsoluteWebPath("trash_12.png") %>" id="deleteSelectedGroupImg_${ItemName}_${gr.ID}"
                                title="<%= Resource.DeleteButton %>" class="display-none">
                            ${gr.Name}
                        </div>
                    {{/each}}
                {{/if}}

            </div>
            <div class="accessRights-selectorContent">
                <div id="userSelector_${ItemName}" class="link dotline plus">${ASC.Resources.Master.AccessRightsAddUser}</div>
                <div id="groupSelector_${ItemName}" class="link dotline plus">${ASC.Resources.Master.AccessRightsAddGroup}</div>
            </div>
        </div>
    </div>
    <div class="accessRights-disabledText" {{if Disabled === false}} style='display:none'{{/if}}>
        ${jq.format(ASC.Resources.Master.AccessRightsDisabledProduct, Name)}
    </div>
</div>
{{/if}}
</script>