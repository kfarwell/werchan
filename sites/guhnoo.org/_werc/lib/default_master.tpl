% masterSiteTitle=`{cat sites/*/_werc/config | grep siteTitle | cut -d'''' -f 2}

<div id="header">
    <div class="superHeader">
% cat `{ get_lib_file top_bar.inc }
    </div>

    <div class="midHeader">
    <h1 class="headerTitle"><a href="
%   if (! ~ $siteTitle $masterSiteTitle) echo $siteTitle
%   if not echo '/'
    ">%($"siteTitle%) <span id="headerSubTitle">%($"siteSubTitle%)</span></a></h1>
    </div>
    
    <div class="subHeader"><br></div>
</div>

% if(~ $siteTitle $masterSiteTitle) {
%   handlers_bar_left=0
<style>
  #side-bar div {
    border-bottom: none;
  }

  #main-copy {
    margin: 0 auto;
    border-left: none;
  }
</style>
% }

% if(! ~ $#handlers_bar_left 0) {
    <div id="side-bar">
%   for(h in $handlers_bar_left) {
        <div>
%       run_handler $$h
        </div>
%   }
    </div>
% }

<div id="main-copy">

% run_handlers $handlers_body_head

% run_handler $handler_body_main

% run_handlers $handlers_body_foot

</div>

<div id="footer">
% if (! ~ `{get_cookie radio} 'disabled') {
    <div class="center">
        <audio controls>
            <source src="http://guhnoo.org:8000" type="audio/ogg">
        </audio>
    </div>
% }
% if (! ~ `{get_cookie ads} 'disabled')
%     cat `{ get_lib_file ad.inc }
% cat `{ get_lib_file footer.inc }
</div>
