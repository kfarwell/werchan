% if (~ $REQUEST_METHOD POST) {
<script>
  location.replace(window.location.href);
</script>
% }

<h1>Settings</h1>
<br />

<form action="" method="POST" onSubmit="javascript:location.reload();">
        <b>Ads:</b>
        <select name="ads">
                <option selected="selected" value="enabled">enabled</option>
                <option value="disabled">disabled</option>
        </select><br />

        <b>Radio:</b>
        <select name="radio">
                <option selected="selected" value="enabled">enabled</option>
                <option value="disabled">disabled</option>
        </select><br />

	<b>Style:</b>
	<select name="style">
		<option value="1995">1995</option>
		<option value="acme">acme</option>
		<option value="alcatel">alcatel</option>
		<option value="apple">apple</option>
		<option selected="selected" value="burichan">burichan</option>
		<option value="cat-v">cat-v</option>
		<option value="darkasmysoul">darkasmysoul</option>
		<option value="facebook">facebook</option>
		<option value="flesh">flesh</option>
		<option value="futaba">futaba</option>
		<option value="gmail">gmail</option>
		<option value="tomorrow">tomorrow</option>
		<option value="zenburn">zenburn</option>
	</select><br />

	<input type="submit" name="set_style" value="Save">
</form>
