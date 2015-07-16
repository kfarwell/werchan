<h1>Radio</h1>

<h2>Listen</h2>
<audio controls>
    <source src="http://guhnoo.org:8000" type="audio/ogg">
</audio>
<p>If your browser doesn't support HTML5 audio or if you prefer, you can listen to the radio directly at <a href="http://guhnoo.org:8000">http://guhnoo.org:8000</a>.</p>

<h2>Upload a song to queue</h2>
<form action="http://f.guhnoo.org/api.php?d=upload" method="post" enctype="multipart/form-data">
    <input type="hidden" name="MAX_FILE_SIZE" value="2000000000" />
    <span>File:</span>
    <input type="file" name="file" />
    <button type="submit">Upload</button><br />
    You still need to queue the song after uploading it!
</form>

<h2>Queue a song</h2>
<form action="" method="post">
    <span>URL:</span>
    <input type="text" name="radio_url" value="http://f.guhnoo.org/" style="width: 80%" />
    <input type="submit" name="radio_queue" value="Queue">
</form>

<h2>Current queue</h2>
<pre>
% mpc playlist
</pre>
