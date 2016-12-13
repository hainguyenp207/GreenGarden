<header class="header">
    <div class="logo-container">
        <a href="../" class="logo">
            <img src="../../assets/images/logo.png" height="35" alt="Porto Admin">
        </a>
        <div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
            <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
        </div>
    </div>

    <!-- start: search & user box -->
    <div class="header-right">

        <span class="separator"></span>

        <div id="userbox" class="userbox">
            <a href="#" data-toggle="dropdown">
                <figure class="profile-picture">
                    <img src="../../assets/images/!logged-user.jpg" alt="Joseph Doe" class="img-circle" data-lock-picture="assets/images/!logged-user.jpg">
                </figure>
                <div class="profile-info" data-lock-name="${userInfo.username}">
                    <span class="name">${userInfo.name}</span>
                    <span class="role">Administrator</span>
                </div>
            </a>
            <a href="/logout" style="text-decoration: none">
                <i class="fa fa-power-off"></i> Logout
            </a>
        </div>

    </div>
    <!-- end: search & user box -->
</header>