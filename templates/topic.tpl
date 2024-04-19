<div data-widget-area="header">
	{{{each widgets.header}}}
	{{widgets.header.html}}
	{{{end}}}
</div>
<div class="row">
	<div class="topic {{{ if widgets.sidebar.length }}}col-lg-9 col-sm-12{{{ else }}}col-lg-12{{{ end }}}" itemid="{url}" itemscope itemtype="https://schema.org/DiscussionForumPosting">
		<meta itemprop="datePublished" content="{timestampISO}">
		<meta itemprop="dateModified" content="{lastposttimeISO}">
		<meta itemprop="author" itemscope itemtype="https://schema.org/Person" itemref="topicAuthorName{{{ if author.userslug }}} topicAuthorUrl{{{ end }}}">
		<meta id="topicAuthorName" itemprop="name" content="{author.username}">
		{{{ if author.userslug }}}<meta id="topicAuthorUrl" itemprop="url" content="{config.relative_path}/user/{author.userslug}">{{{ end }}}
		<div class="topic-header sticky-top">
            			<div class="clearfix">
				
				{{{ if !feeds:disableRSS }}}
				{{{ if rssFeedUrl }}}{{{ end }}}
				{{{ end }}}
				{{{ if browsingUsers }}}
				
				{{{ end }}}

				<!-- IMPORT partials/custom_new_post.tpl -->
			</div>
              <div style="margin-top: 20px; display: flex; align-items: center; font-family: Arial, sans-serif; color: #333; font-size: 16px;">
    <!-- Feed option -->
    <div style="margin-right: 20px;">
        <input type="radio" id="feedOption" name="options" value="feed" style="display: none;">
        <label for="feedOption" style="cursor: pointer; padding: 8px 12px; border-radius: 20px; background-color: #2ca8f6; color: #f0f0f0;">
            Feed
        </label>
    </div>
    <!-- Group option -->
    <div>
        <input type="radio" id="groupOption" name="options" value="group" style="display: none;">
        <label for="groupOption" style="cursor: pointer; padding: 8px 12px; border-radius: 20px; background-color: #f0f0f0;">
            Group
        </label>
    </div>
</div>
<hr style="border: none; border-top: 2px solid #40403e;">
			<h1 component="post/header" class="" itemprop="name">
				<span class="topic-title">
					<span component="topic/labels" class="d-inline-flex gap-2 align-items-center">
						<i component="topic/scheduled" class="fa fa-clock-o {{{ if !scheduled }}}hidden{{{ end }}}" title="[[topic:scheduled]]"></i>
						<i component="topic/pinned" class="fa fa-thumb-tack {{{ if (scheduled || !pinned) }}}hidden{{{ end }}}" title="{{{ if !pinExpiry }}}[[topic:pinned]]{{{ else }}}[[topic:pinned-with-expiry, {pinExpiryISO}]]{{{ end }}}"></i>
						<i component="topic/locked" class="fa fa-lock {{{ if !locked }}}hidden{{{ end }}}" title="[[topic:locked]]"></i>
						<i class="fa fa-arrow-circle-right {{{ if !oldCid }}}hidden{{{ end }}}" title="{{{ if privileges.isAdminOrMod }}}[[topic:moved-from, {oldCategory.name}]]{{{ else }}}[[topic:moved]]{{{ end }}}"></i>
						{{{each icons}}}<span class="lh-1 align-middle">{@value}</span>{{{end}}}
					</span>
					<span component="topic/title">{title}</span>
				</span>
			</h1>


		</div>
		{{{ if merger }}}
		<!-- IMPORT partials/topic/merged-message.tpl -->
		{{{ end }}}

		{{{ if forker }}}
		<!-- IMPORT partials/topic/forked-message.tpl -->
		{{{ end }}}


		{{{ if !scheduled }}}
		<!-- IMPORT partials/topic/deleted-message.tpl -->
		{{{ end }}}

		<ul component="topic" class="posts mt-5" data-tid="{tid}" data-cid="{cid}">
			{{{each posts}}}
				<li component="post" class="{{{ if posts.deleted }}}deleted{{{ end }}} {{{ if posts.selfPost }}}self-post{{{ end }}} {{{ if posts.topicOwnerPost }}}topic-owner-post{{{ end }}}" <!-- IMPORT partials/data/topic.tpl -->>
					<a component="post/anchor" data-index="{./index}" id="{increment(./index, "1")}"></a>

					<meta itemprop="datePublished" content="{posts.timestampISO}">
					<meta itemprop="dateModified" content="{posts.editedISO}">

					<!-- IMPORT partials/topic/post.tpl -->
                    <hr style="border: none; border-top: 2px solid #40403e;">
				</li>
				{{{ if (config.topicPostSort != "most_votes") }}}
				{{{ each ./events}}}
				<!-- IMPORT partials/topic/event.tpl -->
				{{{ end }}}
				{{{ end }}}
			{{{end}}}
		</ul>

		{{{ if browsingUsers }}}
		<div class="visible-xs">
			<!-- IMPORT partials/topic/browsing-users.tpl -->
			<hr/>
		</div>
		{{{ end }}}

		{{{ if config.enableQuickReply }}}
		<!-- IMPORT partials/topic/quickreply.tpl -->
		{{{ end }}}

		{{{ if config.usePagination }}}
		<!-- IMPORT partials/paginator.tpl -->
		{{{ end }}}

		<!-- IMPORT partials/topic/navigator.tpl -->
	</div>
	<div data-widget-area="sidebar" class="col-lg-3 col-sm-12 {{{ if !widgets.sidebar.length }}}hidden{{{ end }}}">
		{{{each widgets.sidebar}}}
		{{widgets.sidebar.html}}
		{{{end}}}
	</div>
</div>

<div data-widget-area="footer">
	{{{each widgets.footer}}}
	{{widgets.footer.html}}
	{{{end}}}
</div>

{{{ if !config.usePagination }}}
<noscript>
<!-- IMPORT partials/paginator.tpl -->
</noscript>
{{{ end }}}
