{include file='header.tpl' menu='people'}


<div class="inside">           

{if $aUsersLast}
	<table class="table table-people">
		<thead>
			<tr>
				<td>{$aLang.user}</td>													
				<td align="center" width="170">{$aLang.user_date_last}</td>
				<td align="center" width="80">{$aLang.user_skill}</td>
				<td align="center" width="80">{$aLang.user_rating}</td>
			</tr>
		</thead>
		
		<tbody class="ludi">
		{foreach from=$aUsersLast item=oUser}
			{assign var="oSession" value=$oUser->getSession()}
			<tr>
				<td><a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(24)}" alt="" class="avatar" /></a><a href="{$oUser->getUserWebPath()}" class="username">{$oUser->getLogin()}</a></td>
				<td align="center" class="date">{date_format date=$oSession->getDateLast()}</td>
				<td align="center" class="strength">{$oUser->getSkill()}</td>							
				<td align="center" class="rating"><strong>{$oUser->getRating()}</strong></td>
			</tr>
		{/foreach}						
		</tbody>
	</table>
{else}
	{$aLang.user_empty}
{/if}
</div>
			
{include file='paging.tpl' aPaging="$aPaging"}		
{include file='footer.tpl'}