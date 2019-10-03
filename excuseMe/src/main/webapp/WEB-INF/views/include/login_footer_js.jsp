
<script>
	function openWindow(url, name, swidth, sheight) {
		var w = (screen.width-swidth)/2;
		var h = (screen.height-sheight)/2;
		window.open(url, name, "width="+swidth+",height="+sheight+",left="+w+",top="+h+",scrollbars=no");
	}
	function closeWindow() {
		window.close();
	}
</script>
