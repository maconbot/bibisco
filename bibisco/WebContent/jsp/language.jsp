<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bibisco.manager.LocaleManager"%>
<%@ taglib prefix="fmt" uri="/jstl/fmt"%>
<%@ taglib prefix="c" uri="/jstl/core"%>
<fmt:setLocale value="<%=LocaleManager.getInstance().getLocale().toString()%>"/>
<script type="text/javascript">
	// init dialog callback
	function bibiscoLanguageInit(ajaxDialog, idCaller, config) {
		
		if (idCaller == 'bibiscoSettingsALanguage') {
			$('#bibiscoLanguageFormInputFrom').val('settings');	
		} else {
			$('#bibiscoLanguageFormInputFrom').val('start');	
		}

		$('#bibiscoLanguageASave').click(function() {
			$('#bibiscoLanguageForm').submit();
		});
		
		$('#bibiscoLanguageForm').submit(function() {
			bibiscoOpenLoadingBanner();
		});

		// tooltip
		$('#bibiscoLanguageASave').tooltip();
		$('#bibiscoLanguageAClose').tooltip();
		
		// preselect bibisco locale
		var bibiscoLocale = '<%=LocaleManager.getInstance().getLocale().toString()%>';
		var option = $('option[value="'+bibiscoLocale+'"]');
		if (option) {
			option.attr('selected','selected');
		}
		
		// select language
		$("#bibiscoLanguageSelectLanguage").select2({
    	    formatResult: formatCreateProjectSelectLanguage,
    	    formatSelection: formatCreateProjectSelectLanguage,
    	    escapeMarkup: function(m) { return m; }
    	});
		
	}
		
	// format select option
	function formatCreateProjectSelectLanguage(state) {
		var originalOption = state.element;
		return state.text;
	}
	
	
	// close dialog callback
	function bibiscoLanguageClose(ajaxDialog, idCaller) {
		$('#bibiscoLanguageAClose').tooltip('hide');
	}

	// before close dialog callback
	function bibiscoLanguageBeforeClose(ajaxDialog, idCaller) {

	}
</script>

<div style="margin-top: 10px;">
	<form id="bibiscoLanguageForm" action="BibiscoServlet">
		<input type="hidden" name="action" value="saveLocale" />
		<input type="hidden" name="from" value="" id="bibiscoLanguageFormInputFrom"/>
		<div class="control-group">
			<label id="bibiscoLanguageSelectBibiscoLanguageLabel" class="control-label" for="bibiscoLanguageSelectBibiscoLanguage"><fmt:message key="jsp.language.form.selectLanguage.label" /></label>
			<div class="controls">
				<select class="selectpicker" style="width:200px;" name="locale" id="bibiscoLanguageSelectLanguage">
					<option value="en_US"><fmt:message key="jsp.language.form.selectLanguage.option.en" /></option>
					<option value="es_ES"><fmt:message key="jsp.language.form.selectLanguage.option.es" /></option>					
					<option value="it_IT"><fmt:message key="jsp.language.form.selectLanguage.option.it" /></option>
					<!--  <option value="de_DE"><fmt:message key="jsp.language.form.selectLanguage.option.de" /></option>
					<option value="fr_FR"><fmt:message key="jsp.language.form.selectLanguage.option.fr" /></option>
					<option value="pt_BR"><fmt:message key="jsp.language.form.selectLanguage.option.pt" /></option>
					-->	
				</select>
			</div>
		</div>
	</form>
</div>
<div class="bibiscoDialogFooter control-group">
	<table style="width: 100%">
		<tr>
			<td style="text-align: right;"><a id="bibiscoLanguageASave" title="<fmt:message key="jsp.common.button.save" />" class="btn btn-primary" style="margin-left: 5px;" href="#"><i
					class="icon-ok icon-white"></i></a> <a id="bibiscoLanguageAClose" title="<fmt:message key="jsp.common.button.close" />" class="btn ajaxDialogCloseBtn" style="margin-left: 5px;" href="#"><i
					class="icon-remove"></i></a></td>
		</tr>
	</table>
</div>