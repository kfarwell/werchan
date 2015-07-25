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
</script>    
% notices_handler
<form action="" method="post">
    <textarea name="comment_text" id="comment_text" cols="80" rows="16">%($"saved_comment_text%)</textarea>
    <br>
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
    <input type="submit" name="bridge_post" value="Post a comment">

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
    <label>Is <a href="http://glenda.cat-v.org">Glenda</a> a cute bunny?
        <select name='ima_robot'>
            <option value="yes">No</option>
            <option value="not">Yes</option>
            <option value="foobar">I hate bunnies!</option>
            <option value="robot">I'm a robot!</option>
        </select>
    </label>
%   }
    <br /><small>Posts are written using <a href="http://daringfireball.net/projects/markdown/syntax">Markdown syntax</a> with some <a href="/markdown">extensions</a>.</small>
% }
</form>

<hr />
<form action="http://f.guhnoo.org/api.php?d=upload" method="post" enctype="multipart/form-data">
    <input type="hidden" name="MAX_FILE_SIZE" value="2000000000" />
        <span>File:</span>
        <input type="file" name="file" />
        <button type="submit">Upload</button><br />
        You still need to include images in your post (<code>![description](http://f.guhnoo.org/blah.png)</code>) after uploading them!
</form>
% }
