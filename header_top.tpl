<div id="header">

    <div class="top-header">
        <ul class="pages">
    		<li {if $sMenuHeadItemSelect=='people'}class="active"{/if}><a href="{router page='people'}">{$aLang.people}</a></li>
			<li {if $sMenuHeadItemSelect=='blogs'}class="active"{/if}><a href="{router page='blogs'}">{$aLang.blogs}</a></li>
    		{if $oUserCurrent}
    			<li {if $sMenuItemSelect=='stream'}class="active"{/if}>
    				<a href="{router page='stream'}">{$aLang.stream_personal_title}</a>
    			</li>
    		{/if}
            
    		{hook run='main_menu'}
    	</ul>

        {if $oUserCurrent}
            <ul class="profile">
                <li class="add"><a href="{router page='topic'}add/" class="button"><span>{$aLang.make}</span></a></li>
                <li class="message">
                    {if $iUserCurrentCountTalkNew}
                        <a href="{router page='talk'}" class="new" title="{$aLang.user_privat_messages_new}">{$iUserCurrentCountTalkNew}</a>
                    {/if}
                    <a href="{router page='talk'}" title="{$aLang.messages}"></a>
                </li>
                <li class="myprofile">
                    <a href="#" title="{$aLang.open_close}" class="signin">
                        <img src="{$oUserCurrent->getProfileAvatarPath(48)}" alt="{$oUserCurrent->getLogin()}" class="avatar" />
                        <img src="{cfg name='path.static.skin'}/images/drop-profile.jpg" />
                    </a>
                </li>

                {hook run='userbar_item'}
            </ul>
        {else}
            <ul class="profile-guest">
                <li><a href="{router page='login'}" id="login_form_show" class="voiti">{$aLang.voiti}</a></li>
                <li class="border">&nbsp;</li>
                <li><a href="{router page='registration'}" class="reg">{$aLang.registration}</a></li>
            </ul>
        {/if}

        {if $oUserCurrent}
        <ul id="signin_menu">
            <li><a href="{$oUserCurrent->getUserWebPath()}">{$aLang.profile}</a></li>
            <li><a href="{router page='topic'}saved/">{$aLang.saved}</a></li>
            <li><a href="{$oUserCurrent->getUserWebPath()}favourites/">{$aLang.favourites}</a></li>
            <li><a href="{router page='my'}{$oUserCurrent->getLogin()}/">{$aLang.my_topics}</a></li>
            <li class="settings"><a href="{router page='settings'}profile/">{$aLang.settings}</a></li>
            <li><a href="{router page='login'}exit/?security_ls_key={$LIVESTREET_SECURITY_KEY}">{$aLang.quit}</a></li>
        </ul>
        {/if}
    </div>

    <div class="btm-header">

        <a href="{cfg name='path.root.web'}" class="logo">
            <ul>
                <li class="title">Live<br />Street</li>
                <li>Your social engine</li>
            </ul>
        </a>

        <div class="left-menu">
            <div class="top-menu">

                <ul class="navigate">
                    <li {if $sMenuHeadItemSelect=='blog' and $sMenuSubItemSelect!='new'}class="active"{/if}><a href="{cfg name='path.root.web'}">{$aLang.topic_title}</a></li>
					<li {if $sMenuItemSelect=='top'}class="active"{/if}><a href="{router page='top'}">{$aLang.best}</a></li>
					{if $iCountTopicsNew>0}
                    	<li {if $sMenuSubItemSelect=='new'}class="active"{/if}><a href="{router page='new'}">{$aLang.new} +{$iCountTopicsNew}</a></li>
					{/if}
					{if $oUserCurrent}
						<li {if $sMenuItemSelect=='feed'}class="active"{/if}>
							<a href="{router page='feed'}">{$aLang.userfeed_title}</a>
						</li>
					{/if}
                </ul>

                <div class="social-buttons">
                    <ul>
                        <li><a href="/" class="fb" title="FACEBOOK"></a></li>
                        <li><a href="/" class="tw" title="TWITTER"></a></li>
                        <li><a href="/" class="vk" title="VKONTAKTE"></a></li>
                        <li><a href="{router page='rss'}" class="rss" title="RSS"></a></li>
                    </ul>
                </div>
            </div>
            <div class="btm-menu">
				{insert name="block" block=simpleUsersTop}

                <div class="search">
                    <form action="{router page='search'}topics/" method="GET">
            			<input class="text" type="text" onblur="if (!value) value=defaultValue" onclick="if (value==defaultValue) value=''" value="{$aLang.search}" name="q" />
            			<input class="search-submit" title="SEARCH" type="submit" value="" />
            		</form>
                </div>
            </div>
        </div>


    </div>

</div>