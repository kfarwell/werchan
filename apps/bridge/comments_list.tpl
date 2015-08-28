<hr>
<h2>Comments</h2>

% for(c in `{ls $comments_dir/}) {
%    if(test -s $c/body) {
        <div class="comment">
        <h5>
%         if(test -f sites/*/team/`{cat $c/user}) echo '          <img class="face" src="/team/'`{cat $c/user}'" />'
          <i>%(`{cat $c/user}%)</i> %(`{cat $c/posted}%) <a href="#%(`{cat $c/postnum}%)" id="%(`{cat $c/postnum}%)">No.</a><a onclick="quotePost(%(`{cat $c/postnum}%))">%(`{cat $c/postnum}%)</a>
        </h5>
%       cat $c/body
        <hr></div>
%    }
% }

