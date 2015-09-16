<%-- 
    Document   : WebChat_Teste
    Created on : 14/09/2015, 17:22:35
    Author     : Elvin
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fresh Tilled Soil Video Conference | WebRTC jQuery Plug-in Demo</title>

<!-- Stylesheet Ressources -->

<link href="fts-webrtc-styles.css" rel="stylesheet" type="text/css"/>
</head>

<body>

<!-- main container -->
<div id="mainContainer" class="main-container">

	<!-- local video -->
	<video id="localVideo" class="local-video" ></video>

	<!-- remote video -->
	<video id="remoteVideo" class="remote-video" autoplay></video>

	<!-- video status & room entry bar -->
	<div id="videoStatus" class="video-status">
	</div>

</div>


<!-- JavaScript Ressources -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="jquery.fresh-tilled-soil-webrtc.js" type="text/javascript"></script>

<!-- Plugin Initialization -->
<script type="text/javascript">
	$(function() {
		$('#mainContainer').createVideoChat();
	});
</script>

</body>
</html>
