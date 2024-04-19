<div class="container w-100">
  <div class="row">
    <div class="col d-flex justify-content-between align-items-center">
      <div component="topic/reply/container" class="btn-group border action-bar rounded-pill" style="width:90%">
        <a href="{config.relative_path}/compose?tid={tid}" class="btn btn-lg" component="topic/reply" data-ajaxify="false" role="button" style="width: calc(100% - 20px); text-align: left; font-size: 20px;">
          <i class="fa fa-edit"></i> Start New Post
        </a>
       
      </div>
	   <div style="display: flex; align-items: center; justify-content: space-around; width: 10%;" >
            <i class="fas fa-filter" style="margin-right: 10px; color: #555; font-size: 20px; margin-left: 5px;"></i>
            <i class="fas fa-search" style="color: #555; font-size: 20px; margin-left: 5px;"></i>
        </div>
    </div>
  </div>
</div>


<!-- IF loggedIn -->
<!-- IF !privileges.topics:reply -->
<!-- IF locked -->
<a component="topic/reply/locked" class="btn btn-sm btn-primary" disabled><i class="fa fa-lock"></i> [[topic:locked]]</a>
<!-- ENDIF locked -->
<!-- ENDIF !privileges.topics:reply -->

<!-- IF !locked -->
<a component="topic/reply/locked" class="btn btn-sm btn-primary hidden" disabled><i class="fa fa-lock"></i> [[topic:locked]]</a>
<!-- ENDIF !locked -->

<!-- ELSE -->

<!-- IF !privileges.topics:reply -->
<a component="topic/reply/guest" href="{config.relative_path}/login" class="btn btn-sm btn-primary">[[topic:guest-login-reply]]</a>
<!-- ENDIF !privileges.topics:reply -->
<!-- ENDIF loggedIn -->