<div>
    <h1>New Thread</h1>
    <form action="" method="POST">
        <p><b>Subject:</b> <input type="text" name="subject" value="%(`{if(~ $#post_arg_subject 1) echo -n $post_arg_subject}%)"></p>
        <textarea name="edit_text" id="edit_text" cols="80" rows="24">%{
# FIXME Extra trailing new lines get added to the content somehow, should avoid it.
            if(~ $#post_arg_edit_text 1)
                echo -n $post_arg_edit_text

        %}</textarea>
        <br>
% if(~ $siteTitle '/poll/') {
        <p><b>Poll options:</b></p>
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
        <br />
% }
        <input type="submit" name="dirdir_save" value="Save">
        <input type="submit" name="dirdir_preview" value="Preview">
        <label>Is <a href="http://glenda.cat-v.org">Glenda</a> a cute bunny?
            <select name='ima_robot'>
                <option value="yes">No</option>
                <option value="not">Yes</option>
                <option value="foobar">I hate bunnies!</option>
                <option value="robot">I'm a robot!</option>
            </select>
        </label>
        <br /><small>Posts are written using <a href="http://daringfireball.net/projects/markdown/syntax">Markdown syntax</a> with some <a href="/markdown">extensions</a>.</small>
    </form>

    <hr />
    <form action="http://f.guhnoo.org/api.php?d=upload" method="post" enctype="multipart/form-data">
        <input type="hidden" name="MAX_FILE_SIZE" value="2000000000" />
            <span>File:</span>
            <input type="file" name="file" />
            <button type="submit">Upload</button><br />
            You still need to include images in your post (<code>![description](http://f.guhnoo.org/blah.png)</code>) after uploading them!
    </form>
</div>

% if(! ~ $"post_arg_dirdir_preview '') {
            <h2>Preview:</h2>
            <div id="preview">
%               echo $post_arg_edit_text | $formatter
            </div>
% }
