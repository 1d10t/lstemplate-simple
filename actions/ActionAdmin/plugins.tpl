{assign var="noSidebar" value=true}
{include file='header.tpl'}


<div class="inside">
<form action="{router page='admin'}plugins/" method="post" id="form_plugins_list">
	<table class="table">
		<thead>
			<tr>
				<td width="20"><input type="checkbox" name="" onclick="ls.tools.checkAll('form_plugins_checkbox', this, true);" /></td>
				<td>{$aLang.plugins_plugin_name}</td>
				<td>{$aLang.plugins_plugin_version}</td>
				<td>{$aLang.plugins_plugin_author}</td>
                                    <td>{$aLang.plugins_plugin_settings}</td>
				<td>{$aLang.plugins_plugin_action}</td>
			</tr>
		</thead>
		
		<tbody>
			{foreach from=$aPlugins item=aPlugin}
				<tr {if $aPlugin.is_active}class="active"{/if}>
					<td><input type="checkbox" name="plugin_del[{$aPlugin.code}]" class="form_plugins_checkbox" /></td>
					<td>
						<h3>{$aPlugin.property->name->data}</h3>
						{$aPlugin.property->description->data}<br />
						{$aPlugin.property->homepage}
					</td>
					<td>{$aPlugin.property->version|escape:'html'}</td>
					<td>{$aPlugin.property->author->data}</td>				
					<td>{if $aPlugin.is_active}<a href="{$aPlugin.property->settings}">{$aPlugin.property->settings}</a>{else}{$aPlugin.property->settings}{/if}</td>
					<td>
						{if $aPlugin.is_active}
							<a href="{router page='admin'}plugins/?plugin={$aPlugin.code}&action=deactivate&security_ls_key={$LIVESTREET_SECURITY_KEY}">{$aLang.plugins_plugin_deactivate}</a>
						{else}
							<a href="{router page='admin'}plugins/?plugin={$aPlugin.code}&action=activate&security_ls_key={$LIVESTREET_SECURITY_KEY}">{$aLang.plugins_plugin_activate}</a>
						{/if}
					</td>
				</tr>
			{/foreach}
		</tbody>
	</table>

    <div class="button2">
        <em></em><span></span><input type="submit" name="submit_plugins_del" value="{$aLang.plugins_submit_delete}" onclick="return (jQuery('.form_plugins_checkbox:checked').size()==0)?false:confirm('{$aLang.plugins_delete_confirm}');" />
    </div>
	<input type="hidden" name="security_ls_key" value="{$LIVESTREET_SECURITY_KEY}" />

</form>
</div>
				

{include file='footer.tpl'}