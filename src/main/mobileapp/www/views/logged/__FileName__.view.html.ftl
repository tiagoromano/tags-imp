<ion-view cache-view="false" hide-back-button="true" role="region">
    <ion-header-bar role="heading" class="bar bar-header bar-default" xattr-theme="bar-default"
                    data-component="crn-ion-header-bar">
        <div side="left" class="buttons buttons-left header-item">
            <button aria-labelledby="left_navicon_sr" class="button button-clear"
                    ng-if="!${model.dataSourceName}.inserting && !${model.dataSourceName}.editing" menu-toggle="left"
                    data-component="crn-button" xattr-type="button-clear">
                <i class="icon ion-navicon"></i>
                <span id="left_navicon_sr"
                      class="sr-only">{{'Accessibility.Button.Aria.Label.NavIcon' | translate}}</span>
            </button>
            <button aria-labelledby="left_arrowback_sr" class="button button-clear"
                    ng-if="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing"
                    ng-click="${model.dataSourceName}.cancel()" data-component="crn-button" xattr-type="button-clear">
                <i class="icon ion-ios-arrow-back"></i>
                <span id="left_arrowback_sr" class="sr-only">{{'Roles.view.Voltar' | translate}}</span>
            </button>
        </div>
        <h1 class="title">${model.dataSourceName}</h1>
        <div side="right" class="buttons buttons-right header-item">
            <button aria-labelledby="right_plus_sr" class="button button-clear"
                    ng-if="!${model.dataSourceName}.inserting && !${model.dataSourceName}.editing"
                    ng-click="${model.dataSourceName}.startInserting()" data-component="crn-button"
                    xattr-type="button-clear">
                <i class="icon ion-ios-plus-empty"></i>
                <span id="right_plus_sr" class="sr-only">{{'Accessibility.Button.Aria.Label.Add' | translate}}</span>
            </button>
            <button aria-labelledby="right_checkmark_sr" class="button button-clear"
                    ng-if="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing"
                    ng-click="${model.dataSourceName}.post()" data-component="crn-button" xattr-type="button-clear">
                <i class="icon ion-ios-checkmark"></i>
                <span id="right_checkmark_sr"
                      class="sr-only">{{'Accessibility.Button.Aria.Label.Save' | translate}}</span>
            </button>
        </div>
    </ion-header-bar>
    <ion-content>
        <div class="component-holder ng-binding ng-scope ui-draggable ui-draggable-handle"
             data-component="crn-datasource" id="crn-datasource-906854">
            <datasource data-component="crn-datasource" <#if model.hasColumnFilter()>filter=""</#if> name="${model.dataSourceName}"
                        entity="${model.dataSourceFullName}" keys="${model.dataSourcePrimaryKeys}" rows-per-page="10"
                        delete-message="Deseja remover?" class=""
                        schema="${model.getDSSchema(model.dataSourceName)}" ></datasource>
        </div>
    <#-- Para o filtro model.getGridFilterSearchable()="generalSearch" a regra está no componente "cron-list" -->
      <#if model.getGridFilterSearchable()=="specificSearch">
          <#if model.hasSearchableFilter()>
	<div ng-hide="${model.dataSourceName}.inserting || ${model.dataSourceName}.editing"
         class="component-holder ng-binding ng-scope" data-component="crn-complex-search">
	  <#list model.formFields as field>
          <#if field.isSearchable()>
		<div role="search" data-component="crn-search" id="crn-search-${field.name}-${model.random}">
            <div class="item item-input" id="search-${field.name}-${model.random}">
                <i class="icon ion-search placeholder-icon"></i>
                <input aria-label="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
                       type="<#if field.isDate() >date<#elseif (field.isTimestamp() || field.isTime())>time<#elseif (field.isBoolean())>checkbox<#elseif (field.isNumber() || field.isDecimal() || field.isLong())>number<#else>text</#if>"
                       ng-model="vars.search${field.name}" mask="${model.formMapMasks[field.name]}"
                       cronapp-filter="${field.name}" crn-datasource="${model.dataSourceName}"
                       cronapp-filter-caseinsensitive="true" cronapp-filter-autopost="false" cronapp-filter-operator="="
                       placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>">
            </div>
        </div>
          </#if>
      </#list>
        <button aria-label="{{" template.crud.search" | translate}}" class="button button-dark component-holder"
        data-component="crn-filter-button" type="submit" cronapp-filter="" cronapp-filter-caseinsensitive="true"
        xattr-size="" xattr-fullsize="" xattr-theme="btn-default" crn-datasource="${model.dataSourceName}" ng-click=""
        id="crn-button-search">
        <i class="ion ion-home"></i>
        <span>{{"template.crud.search" | translate}}</span>
        </button>
    </div>
          </#if>
      </#if>

        <div crn-datasource="${model.dataSourceName}" class="" ng-hide="${model.dataSourceName}.editing || ${model.dataSourceName}.inserting">
            <cron-list ng-model="vars.cronlist${model.dataSourceName}" id="ion-list-main" options="${model.getMobileAdvancedList(model.dataSourceName, model.dataSourceName, field)}" class="component-holder ng-binding ng-scope" data-component="crn-ion-list" id="crn-ion-list-${model.random}">
            </cron-list>
        </div>
        <div ng-show="${model.dataSourceName}.editing || ${model.dataSourceName}.inserting">
            <form crn-datasource="${model.dataSourceName}">
                <div class="list"
                     ng-disabled="!${model.dataSourceName}.editing &amp;&amp; !${model.dataSourceName}.inserting">
            <#list model.formFields as field>
            <!-- ${field.name} begin -->
                <#if field.isBoolean() >
			<div class="component-holder ng-binding ng-scope" data-component="crn-checkbox" id="crn-checkbox-${field.name}">
                <label class="item item-checkbox">
                    <span><#if field.label?has_content>${field.label}<#else>${field.name}</#if></span>
                    <div for="textinput-${field.name}" class="checkbox checkbox-assertive">
                        <input aria-label="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
                               type="checkbox" ng-model="${model.dataSourceName}.active.${field.name}"
                               id="textinput-${field.name}" name="textinput-${field.name}"
                               <#if !field.isNullable()>required="required"</#if>>
                        <div class="track">
                            <div class="handle"></div>
                        </div>
                    </div>
                </label>
            </div>
                <#elseif field.isDate() >
            <label for="textinput-${field.name}-${model.random}" class="item item-input item-stacked-label"
                   data-component="crn-input-floating" id="lbl-${field.name}-${model.random}">
                <span class="input-label">${model.formMapLabels[field.name]!}</span>
                <input aria-label="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" type="date"
                       placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
                       ng-model="${model.dataSourceName}.active.${field.name}"
                       id="textinput-${field.name}-${model.random}" name="textinput-${field.name}"
                       <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"<#else>
                       mask=""</#if> <#if !field.isNullable()>required="required"</#if>>
            </label>
                <#elseif field.isTimestamp()>
            <label for="textinput-${field.name}-${model.random}" class="item item-input item-stacked-label"
                   data-component="crn-input-floating" id="lbl-${field.name}-${model.random}">
                <span class="input-label">${model.formMapLabels[field.name]!}</span>
                <input aria-label="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
                       type="datetime"
                       placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
                       ng-model="${model.dataSourceName}.active.${field.name}"
                       id="textinput-${field.name}-${model.random}" name="textinput-${field.name}"
                       <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"<#else>
                       mask=""</#if> <#if !field.isNullable()>required="required"</#if>>
            </label>
                <#elseif field.isTime()>
            <label for="textinput-${field.name}-${model.random}" class="item item-input item-stacked-label"
                   data-component="crn-input-floating" id="lbl-${field.name}-${model.random}">
                <span class="input-label">${model.formMapLabels[field.name]!}</span>
                <input aria-label="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" type="time"
                       placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
                       ng-model="${model.dataSourceName}.active.${field.name}"
                       id="textinput-${field.name}-${model.random}" name="textinput-${field.name}"
                       <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"<#else>
                       mask=""</#if> <#if !field.isNullable()>required="required"</#if>>
            </label>
                <#elseif field.isNumber() >
            <label for="textinput-${field.name}-${model.random}" class="item item-input item-stacked-label"
                   data-component="crn-input-floating" id="lbl-${field.name}-${model.random}">
                <span class="input-label">${model.formMapLabels[field.name]!}</span>
                <input aria-label="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" type="integer"
                       placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
                       ng-model="${model.dataSourceName}.active.${field.name}"
                       id="textinput-${field.name}-${model.random}" name="textinput-${field.name}"
                       <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"<#else>
                       mask=""</#if> <#if !field.isNullable()>required="required"</#if>>
            </label>
                <#elseif (field.isByte() || field.isInteger()) >
                  <label for="textinput-${field.name}-${model.random}" class="item item-input item-stacked-label"
                         data-component="crn-input-floating" id="lbl-${field.name}-${model.random}">
                      <span class="input-label">${model.formMapLabels[field.name]!}</span>
                      <input aria-label="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
                             type="integer"
                             placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
                             ng-model="${model.dataSourceName}.active.${field.name}"
                             id="textinput-${field.name}-${model.random}" name="textinput-${field.name}"
                             <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"<#else>
                             mask=""</#if> <#if !field.isNullable()>required="required"</#if>>
                  </label>
                <#elseif field.isLong() >
                  <label for="textinput-${field.name}-${model.random}" class="item item-input item-stacked-label"
                         data-component="crn-input-floating" id="lbl-${field.name}-${model.random}">
                      <span class="input-label">${model.formMapLabels[field.name]!}</span>
                      <input aria-label="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
                             type="number"
                             placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
                             ng-model="${model.dataSourceName}.active.${field.name}"
                             id="textinput-${field.name}-${model.random}" name="textinput-${field.name}"
                             <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"<#else>
                             mask=""</#if> <#if !field.isNullable()>required="required"</#if>>
                  </label>
                <#elseif field.isDecimal() >
            <label for="textinput-${field.name}-${model.random}" class="item item-input item-stacked-label"
                   data-component="crn-input-floating" id="lbl-${field.name}-${model.random}">
                <span class="input-label">${model.formMapLabels[field.name]!}</span>
                <input aria-label="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" type="number"
                       placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
                       ng-model="${model.dataSourceName}.active.${field.name}"
                       id="textinput-${field.name}-${model.random}" name="textinput-${field.name}"
                       <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"<#else>
                       mask=""</#if> <#if !field.isNullable()>required="required"</#if>>
            </label>
                <#elseif field.isChar() >
            <label for="textinput-${field.name}-${model.random}" class="item item-input item-stacked-label"
                   data-component="crn-input-floating" id="lbl-${field.name}-${model.random}">
                <span class="input-label">${model.formMapLabels[field.name]!}</span>
                <input aria-label="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" type="text" maxlength="1"
                       placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
                       ng-model="${model.dataSourceName}.active.${field.name}"
                       id="textinput-${field.name}-${model.random}" name="textinput-${field.name}"
                       <#if model.formMapMasks[field.name]?has_content>mask="${model.formMapMasks[field.name]}"<#else>
                       mask=""</#if> <#if !field.isNullable()>required="required"</#if>>
            </label>
                <#elseif field.getProperty("ngOptions")??>
            <datasource data-component="crn-datasource" name="${field.name!?replace("_", " ")?capitalize?replace(" ", "")}"
                        entity="${field.getProperty("ngOptions").dataSourceUrl}"
                        keys="${field.getProperty("ngOptions").keys}" class=""
                        schema="${model.getDSSchema(field.getProperty("ngOptions").dataSourceName)}"></datasource>
            <label for="textinput-${field.name}" class="item item-input item-select component-holder"
                   data-component="crn-dynamic-select" id="crn-dynamic-select-${field.name}">
                <span class="input-label">${model.formMapLabels[field.name]!}</span>
                <select aria-label="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" crn-datasource="${field.name!?replace("_", " ")?capitalize?replace(" ", "")}"
                        ng-model="${model.dataSourceName}.active.${field.name}" class="form-control"
                        id="dynamic-${field.name}"
                        name="dynamic-${field.name}"
                        xkey-field="${field.getProperty("ngOptions").keys}"
                        xdisplay-field="${field.getProperty("ngOptionsFkName")}"
                        <#if !field.isNullable()>required="required"</#if>>
                    <option value=''>None</option>
                </select>
            </label>
                <#elseif field.isImage()>
              <div class="item item-input item-stacked-label component-holder" data-component="crn-dynamic-image"
                   id="crn-dynamic-image-${field.name}">
                  <label class="input-label">${model.formMapLabels[field.name]!}</label>
                  <div class="form-group">
                      <div alt="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>" dynamic-image="" ng-model="${model.dataSourceName}.active.${field.name}" max-file-size="5MB"
                           class="dynamic-image-container" ng-required="false">
                          {{"template.crud.clickToAddImage" | translate}}
                      </div>
                  </div>
              </div>
                <#elseif field.isFile()>
            <div class="component-holder ng-binding ng-scope" data-component="crn-dynamic-file">
                <div class="item item-input item-stacked-label">
                    <label class="input-label">${model.formMapLabels[field.name]!}</label>
                    <div class="form-group">
                        <div dynamic-file="" ng-model="${model.dataSourceName}.active.${field.name}" max-file-size="5MB"
                             class="dynamic-image-container" ng-required="false">
                            {{"template.crud.clickToAddFile" | translate}}
                        </div>
                    </div>
                </div>
            </div>
                <#else>
            <label for="textinput-${field.name}-${model.random}" class="item item-input item-stacked-label"
                   data-component="crn-input-floating" id="lbl-${field.name}-${model.random}">
                <span class="input-label">${model.formMapLabels[field.name]!}</span>
                <input
                        type="text"
                        placeholder="<#if field.label?has_content>${field.label}<#else>${field.name}</#if>"
                        ng-model="${model.dataSourceName}.active.${field.name}"
                        id="textinput-${field.name}-${model.random}"
                        name="textinput-${field.name}"
				<#if model.formMapMasks[field.name]?has_content> mask="${model.formMapMasks[field.name]}" <#else>
                        mask=""
                    <#if model.formMapMasks[field.name] == "999.999.999-99" >
                        <#assign valid = "cpf" >
                    <#elseif model.formMapMasks[field.name] == "99.999.999/9999-99">
                        <#assign valid = "cnpj" >
                    </#if>
                    <#if valid??>
				valid="${valid}"
				data-error-message="{{'invalid.${valid}' | translate}}"
                    </#if>
                </#if>
				<#if !field.isNullable()>required="required"</#if>>
            </label>
                </#if>
            </#list>

                    <!-- NtoN  -->
            <#list model.formFieldsNToN as field>
                <#assign relationClassName = "">
                <#assign dataSourceName = "">
                <#assign keysDs = "">
                <#if model.getManyToManyRelationship(field.getName())?? && model.getManyToManyRelationship(field.getName()).getRelationClassField().getClazz()??>
                    <#assign relationClassName = "${model.getManyToManyRelationship(field.getName()).getRelationClassField().getClazz()}">
                    <#if model.getManyToManyRelationship(field.getName()).getRelationClassField().getClazz().getAdjustedFullPrimaryKeys()??>
                        <#assign keysDs = "${model.getJoinKeys(model.getManyToManyRelationship(field.getName()).getRelationClassField().getClazz().getAdjustedFullPrimaryKeys())}">
                    </#if>
                </#if>

                <#if !field.getProperty("NToNOption")?has_content || field.getProperty("NToNOption") == "Lista">
	  <datasource
              data-component="crn-datasource"
              name="${relationClassName}"
              entity="${model.namespace}.${relationClassName}"
              keys="${keysDs}"
              dependent-lazy-post="${model.dataSourceName}"
              rows-per-page="100"
              parameters="${model.dataSourceName?uncap_first}={{${model.dataSourceName}.active.${model.dataSourcePrimaryKeys}|raw}}"
              schema="${model.getDSSchema(relationClassName)}">
      </datasource>
	  <datasource
              data-component="crn-datasource"
              name="All${field.getName()}"
              entity="${model.namespace}.${field.getName()}"
              keys="${model.getJoinKeys(field.getClazz().getAdjustedFullPrimaryKeys())}"
              schema="${model.getDSSchema(field.getName())}">
      </datasource>
            <label class="item item-input item-select component-holder" data-component="crn-multiselect">
                <span>${field.getName()?cap_first}</span>
                <select
                        ng-model="${relationClassName}.data"
                        crn-datasource="All${field.getName()}"
                        multiple
                        id="multiselect-${field.name}"
                        name="multiselect-${field.name}"
                        xkey-field="${model.getFirstTextFieldOfManyToManyRelation(field.getName())}"
                        xdisplay-field="${model.getFirstTextFieldOfManyToManyRelation(field.getName())}">
                </select>
            </label>
                </#if>
            </#list>
                    <!-- NtoN  end-->
            </form>
        </div>
    </ion-content>
</ion-view>
