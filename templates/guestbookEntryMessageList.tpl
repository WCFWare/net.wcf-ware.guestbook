<ul class="messageList guestbookEntryList">
	{foreach from=$objects item=entry}
		<li>
			<article class="message messageReduced marginTop{if $entry->isDeleted} messageDeleted{/if}" data-object-id="{@$entry->entryID}" data-user-id="{@$entry->userID}"
				data-is-deleted="{@$entry->isDeleted}"
				data-can-delete-entry="{if $__wcf->getSession()->getPermission('mod.guestbook.canModerateGuestbook')}true{else}false{/if}" data-can-edit-entry="{if $entry->canEdit()}true{else}false{/if}" data-can-moderate-entry="{if $__wcf->getSession()->getPermission('mod.guestbook.canModerateGuestbook')}true{else}false{/if}">
				<div>
					<section class="messageContent">
						<div>
							<header class="messageHeader">
								<div class="box32">
									{if $entry->userID}
										<a href="{link controller='User' object=$entry->getUserProfile()}{/link}" class="framed">{@$entry->getUserProfile()->getAvatar()->getImageTag(32)}</a>
									{else}
										<span class="framed">{@$entry->getUserProfile()->getAvatar()->getImageTag(32)}</span>
									{/if}
									
									<div class="messageHeadline">
										<h1>{$entry->subject}</h1>
										<p>
											<span class="username">{if $entry->userID}<a href="{link controller='User' object=$entry->getUserProfile()}{/link}" class="userLink" data-user-id="{@$entry->userID}">{$entry->username}</a>{else}{$entry->username}{/if}</span>
											{@$entry->time|time}
										</p>
									</div>
								</div>
								
								{event name='messageHeader'}
							</header>
							
							<div class="messageBody">
								<div>
									{@$entry->getFormattedExcerpt()}
								</div>
								
								{event name='messageBody'}
								
								<div class="messageFooter">
									{event name='messageFooterNotes'}
								</div>
								
								<footer class="messageOptions">
									<nav class="jsMobileNavigation buttonGroupNavigation">
										<ul class="smallButtons buttonGroup">
											{if $entry->canEdit()}<li><a href="{link application='wcf' controller='GuestbookEntryEdit' id=$entry->entryID}{/link}" class="button jsButtonEntryInlineEditor" title="{lang}wcf.guestbook.entry.edit{/lang}"><span class="icon icon16 icon-pencil"></span> <span>{lang}wcf.global.button.edit{/lang}</span></a></li>{/if}
											{event name='messageOptions'}
											<li class="toTopLink"><a href="{@$__wcf->getAnchor('top')}" title="{lang}wcf.global.scrollUp{/lang}" class="button jsTooltip"><span class="icon icon16 icon-arrow-up"></span> <span class="invisible">{lang}wcf.global.scrollUp{/lang}</span></a></li>
										</ul>
									</nav>
								</footer>
							</div>
						</div>
					</section>
				</div>
			</article>
		</li>
	{/foreach}
</ul>