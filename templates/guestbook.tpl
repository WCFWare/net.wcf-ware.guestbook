{include file='documentHeader'}

<head>
	<title>{lang}wcf.header.menu.guestbook{/lang} - {PAGE_TITLE|language}</title>
	
	{include file='headInclude'}
</head>

<body id="tpl{$templateName|ucfirst}">

{include file='header'}

<header class="boxHeadline">
	<h1>{lang}wcf.header.menu.guestbook{/lang}</h1>
</header>

{include file='userNotice'}

{if $objects}
	{include file='guestbookEntryMessageList' application='wcf'}
{/if}

<div class="contentNavigation">
	{hascontent}
		<nav>
			<ul>
				{content}
					{if $__wcf->session->getPermission('user.guestbook.canAddEntry')}<li><a href="{link application='wcf' controller='GuestbookEntryAdd'}{/link}" title="{lang}wcf.guestbook.entry.add{/lang}" class="button"><span class="icon icon16 icon-asterisk"></span> <span>{lang}wcf.guestbook.entry.button.add{/lang}</span></a></li>{/if}
					{event name='contentNavigationButtonsTop'}
				{/content}
			</ul>
		</nav>
	{/hascontent}
</div>

{hascontent}
	<div class="container marginTop">
		<ul class="containerList infoBoxList">
			{content}
				{if GUESTBOOK_ENABLE_STATS}
					<li class="box32 statsInfoBox">
						<span class="icon icon32 icon-bar-chart"></span>
						<div>
							<div class="containerHeadline">
								<h3>{lang}wcf.guestbook.stats{/lang}</h3>
								<p>{lang}wcf.guestbook.stats.detail{/lang}</p>
							</div>
						</div>
					</li>
				{/if}
				{event name='infoBoxes'}
			{/content}
		</ul>
	</div>
{/hascontent}

{include file='footer'}

</body>
</html>