<div>
    <h1>New Thread</h1>
    <form action="" method="POST">
        <p>
        <input id="subject" type="text" name="subject" placeholder="Subject" value="%(`{if(~ $#post_arg_subject 1) echo -n $post_arg_subject}%)">
        <textarea name="edit_text" id="edit_text">%{
# FIXME Extra trailing new lines get added to the content somehow, should avoid it.
            if(~ $#post_arg_edit_text 1)
                echo -n $post_arg_edit_text

        %}</textarea>
        <br /><small>werchan supports fancy post formatting. <a href="/formatting">Learn the syntax here.</a></small>
% if(~ $siteTitle '/poll/') {
        <p><b>Poll options:</b><br />
        <input type="text" name="poll0" size="80" value="%(`{if(~ $#post_arg_poll0 1) echo -n $post_arg_poll0}%)"><br />
        <input type="text" name="poll1" size="80" value="%(`{if(~ $#post_arg_poll1 1) echo -n $post_arg_poll1}%)"><br />
        <input type="text" name="poll2" size="80" value="%(`{if(~ $#post_arg_poll2 1) echo -n $post_arg_poll2}%)"><br />
        <input type="text" name="poll3" size="80" value="%(`{if(~ $#post_arg_poll3 1) echo -n $post_arg_poll3}%)"><br />
        <input type="text" name="poll4" size="80" value="%(`{if(~ $#post_arg_poll4 1) echo -n $post_arg_poll4}%)"><br />
        <input type="text" name="poll5" size="80" value="%(`{if(~ $#post_arg_poll5 1) echo -n $post_arg_poll5}%)"><br />
        <input type="text" name="poll6" size="80" value="%(`{if(~ $#post_arg_poll6 1) echo -n $post_arg_poll6}%)"><br />
        <input type="text" name="poll7" size="80" value="%(`{if(~ $#post_arg_poll7 1) echo -n $post_arg_poll7}%)"><br />
        <input type="text" name="poll8" size="80" value="%(`{if(~ $#post_arg_poll8 1) echo -n $post_arg_poll8}%)"><br />
        <input type="text" name="poll9" size="80" value="%(`{if(~ $#post_arg_poll9 1) echo -n $post_arg_poll9}%)"><br />
        </p>
% }
        <p><label><b>Captcha:</b> Is <a href="http://glenda.cat-v.org">Glenda</a> a cute bunny?
            <select name='ima_robot'>
                <option value="yes">No</option>
                <option value="not">Yes</option>
                <option value="foobar">I hate bunnies!</option>
                <option value="robot">I'm a robot!</option>
            </select>
        </label></p>
        <p><input type="submit" name="dirdir_save" value="Save">
        <input type="submit" name="dirdir_preview" value="Preview"></p>
    </form>

    <hr style="margin: 2em 0" />
    <form action="http://f.guhnoo.org/api.php?d=upload" method="post" enctype="multipart/form-data"><p>
        <input type="hidden" name="MAX_FILE_SIZE" value="2000000000" />
            <span><b>File:</b></span>
            <input type="file" name="file" />
            <button type="submit">Upload</button><br />
            <small>You still need to include files in your post after uploading them! Embed them with <code>![description](http://f.guhnoo.org/blah.png)</code>.</small>
    </p></form>
</div>

% if(! ~ $"post_arg_dirdir_preview '') {
            <h2>Preview:</h2>
            <div id="preview">
%               echo $post_arg_edit_text | $formatter
            </div>
% }


<hr>
% nav_tree_ext
