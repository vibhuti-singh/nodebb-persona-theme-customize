{{{ if (!./index && widgets.mainpost-header.length) }}}
<div data-widget-area="mainpost-header">
	{{{ each widgets.mainpost-header }}}
	{widgets.mainpost-header.html}
	{{{ end }}}
</div>
{{{ end }}}

<div class="clearfix post-header">
	<div class="icon float-start">
		<a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">
			{buildAvatar(posts.user, "48px", true, "", "user/picture")}
			<i component="user/status" class="fa fa-circle status {posts.user.status}" title="[[global:{posts.user.status}]]"></i>
		</a>
	</div>

	<small class="d-flex">
		<div class="d-flex align-items-center gap-1 flex-wrap w-100">
			<strong class="text-nowrap">
				<a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->" itemprop="author" data-username="{posts.user.username}" data-uid="{posts.user.uid}">{posts.user.displayname}</a>
			</strong>

			{{{ each posts.user.selectedGroups }}}
			{{{ if posts.user.selectedGroups.slug }}}
			<!-- IMPORT partials/groups/badge.tpl -->
			{{{ end }}}
			{{{ end }}}

			<!-- IF posts.user.banned -->
			<span class="badge bg-danger">[[user:banned]]</span>
			<!-- ENDIF posts.user.banned -->

			<span class="visible-xs-inline-block visible-sm-inline-block visible-md-inline-block visible-lg-inline-block">
				<!-- IF posts.toPid -->
				<a component="post/parent" class="btn btn-sm btn-outline-secondary hidden-xs" data-topid="{posts.toPid}" href="{config.relative_path}/post/{posts.toPid}"><i class="fa fa-reply"></i> @<!-- IF posts.parent.username -->{posts.parent.username}<!-- ELSE -->[[global:guest]]<!-- ENDIF posts.parent.username --></a>
				<!-- ENDIF posts.toPid -->

				<span>
					<!-- IF posts.user.custom_profile_info.length -->
					&#124;
					{{{each posts.user.custom_profile_info}}}
					{posts.user.custom_profile_info.content}
					{{{end}}}
					<!-- ENDIF posts.user.custom_profile_info.length -->
				</span>
			</span>
			<div class="d-flex align-items-center gap-1 flex-grow-1 justify-content-end">
				<span>
					<i component="post/edit-indicator" class="fa fa-pencil-square<!-- IF privileges.posts:history --> pointer<!-- END --> edit-icon <!-- IF !posts.editor.username -->hidden<!-- ENDIF !posts.editor.username -->"></i>

					<span data-editor="{posts.editor.userslug}" component="post/editor" class="hidden">[[global:last-edited-by, {posts.editor.username}]] <span class="timeago" title="{isoTimeToLocaleString(posts.editedISO, config.userLang)}"></span></span>

					<span class="visible-xs-inline-block visible-sm-inline-block visible-md-inline-block visible-lg-inline-block">
						<a class="permalink text-muted" href="{config.relative_path}/post/{posts.pid}"><span class="timeago" title="{posts.timestampISO}"></span></a>
					</span>
				</span>
				<span class="bookmarked"><i class="fa fa-bookmark-o"></i></span>
			</div>
		</div>
	</small>
</div>

<br />

<div class="content" component="post/content" itemprop="text">
	{posts.content}
</div>

<div class="post-footer d-flex justify-content-between align-items-center">
    {{{ if posts.user.signature }}}
    <div component="post/signature" data-uid="{posts.user.uid}" class="post-signature">{posts.user.signature}</div>
    {{{ end }}}
    
    <div class="d-flex align-items-center">
        <!-- IF !reputation:disabled -->
        <span class="votes">
            <a component="post/upvote" href="#">
                <i class="fas fa-heart"></i> 
            </a>
            <span component="post/vote-count" data-votes="{posts.votes}" style="color: black;">{posts.votes}</span>
        </span>
        <!-- ENDIF !reputation:disabled -->
        
        <div class="d-flex align-items-center mx-3">
            {{{ if !hideReplies }}}
            <a component="post/reply-count" data-target-component="post/replies/container" href="#" class="threaded-replies user-select-none text-muted <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">
                <i class="fas fa-comment" component="post/replies/open"></i>
                <i class="fa fa-fw fa-chevron-down hidden" component="post/replies/close"></i>
                <i class="fa fa-fw fa-spin fa-spinner hidden" component="post/replies/loading"></i>
            </a>
            <span class="mx-2">{{posts.replies.count}}</span>
            {{{ end }}}	   
        </div>
        
        {{{ if config.loggedIn }}}
        <div class="mx-3">
            <a class="dropdown-item" component="post/bookmark" role="menuitem" href="#" data-bookmarked="{posts.bookmarked}">
                <span class="">
                    <i component="post/bookmark/on" style="color: black;" class="fa-solid fa-bookmark <!-- IF !posts.bookmarked -->hidden<!-- ENDIF !posts.bookmarked -->"></i>
                    <i component="post/bookmark/off" class="fa-regular fa-bookmark <!-- IF posts.bookmarked -->hidden<!-- ENDIF posts.bookmarked -->"></i>
                </span>
                <span component="post/bookmark-count" class="bookmarkCount badge" data-bookmarks="{posts.bookmarks}" style="color: black;">{posts.bookmarks}</span>&nbsp;
            </a>
        </div>
        {{{ end }}}
    </div>

    <!-- IMPORT partials/topic/post-menu.tpl -->
</div>

<div component="post/replies/container"></div>

{{{ if (!./index && widgets.mainpost-footer.length) }}}
<div data-widget-area="mainpost-footer">
	{{{ each widgets.mainpost-footer }}}
	{widgets.mainpost-footer.html}
	{{{ end }}}
</div>
{{{ end }}}