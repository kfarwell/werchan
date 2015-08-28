% masterSiteTitle=`{cat sites/*/_werc/config | grep siteTitle | cut -d'''' -f 2}
% if(! ~ $siteTitle $masterSiteTitle) {
<script>
    function quotePost(num) {
        document.getElementById('comment_text').value+="@" + num + "\n";
    }
    // legacy support for old threads, new OPs use `quotePost("OP")` directly
    function quoteOP() {
        quotePost("OP");
    }
    function vote(option) {
        document.getElementById('poll').value=option;
    }
</script>    
% notices_handler
<form action="" method="post">
    <h2>Leave a comment</h2>
    <p><textarea name="comment_text" id="comment_text">%($"saved_comment_text%)</textarea>
    <br /><small>werchan supports fancy post formatting. <a href="/formatting">Learn the syntax here.</a></small></p>
% if(~ $siteTitle '/poll/') {
    <p><b>Vote:</b>
    <label>
        <select name='poll' id='poll'>
% poll=$sitedir$req_path'_poll'
% for(i in `{cat $poll}) {
            <option value="%($i%)">%($i%)</option>
% }
        </select>
    </label></p>
% }

% if(~ $#logged_user 0) {
%   if(~ $#allow_new_user_comments 1) {
    <label>New user name:
        <input type="text" name="comment_user" value="%($"post_arg_comment_user%)">
    </label>

    <label>Password:
        <input type="password" name="comment_passwd" value="">
    </label>

    <label>Repeat password:
        <input type="password" name="comment_passwd2" value="">
    </label>
    <div style="font-size: 70%">
    Enter your desired user name/password and after your comment has been reviewed by an admin it will be posted and your account will be enabled. If you are already registered please <a href="/_users/login">login</a> before posting.
    </div>
%   }
%   if not if(~ $#bridge_anon_comments 1) {
    <p><label><b>Captcha:</b> Is <a href="http://glenda.cat-v.org">Glenda</a> a cute bunny?
        <select name='ima_robot'>
            <option value="yes">No</option>
            <option value="not">Yes</option>
            <option value="foobar">I hate bunnies!</option>
            <option value="robot">I'm a robot!</option>
        </select>
    </label></p>
%   }
% }
    <p><input type="submit" name="bridge_post" value="Save">
    <input type="submit" name="bridge_preview" value="Preview"></p>
</form>

<hr style="margin: 2em 0" />
<form action="http://f.guhnoo.org/api.php?d=upload" method="post" enctype="multipart/form-data"><p>
    <input type="hidden" name="MAX_FILE_SIZE" value="2000000000" />
        <span>File:</span>
        <input type="file" name="file" />
        <button type="submit">Upload</button><br />
        <small>You still need to include files in your post after uploading them! Embed them with <code>![description](http://f.guhnoo.org/blah.png)</code>.</small>
</p></form>
% }

% if(! ~ $"post_arg_bridge_preview '') {
            <h2>Preview:</h2>
            <div id="preview">
%               echo $post_arg_comment_text | $formatter
            </div>
% }
