<cfset sessionstorage = getInstance( 'sessionStorage@cbstorages' )><cfoutput><!DOCTYPE html><html lang="en"><head>	<meta charset="utf-8">	<title>#Event.getValue("title", "No Title Set, Default Title")#</title>	<meta name="description" content="ColdBox Application Template">    <meta name="author" content="Ortus Solutions, Corp">	<!---Base URL --->	<base href="#event.getHTMLBaseURL()#" />	<!---css --->	<link href="includes/css/bootstrap.min.css" rel="stylesheet">	<link href="includes/css/style.css" rel="stylesheet">	<!---js --->    <script src="includes/js/jquery.js"></script>	<script src="includes/js/bootstrap.min.js"></script>	<script src="includes/js/scripts.js"></script>	<style>	 /* Utility */	.centered { text-align: center !important; }	.inline{ display: inline !important; }	.margin10{ margin: 10px; }	.padding10{ padding: 10px; }	.margin0{ margin: 0px; }	.padding0{ padding: 0px; }	.footer {	  margin-top: 45px;	  padding: 35px 35px;	  border-top: 1px solid ##e5e5e5;	}	.footer p {	  margin-bottom: 0;	  color: ##555;	}	body{ padding-top: 50px; }	</style></head><body data-spy="scroll">	<div class="container">#renderView()#</div>	<footer class="footer">	</footer>	<script>	$(function() {		// activate all drop downs		$('.dropdown-toggle').dropdown();		// Tooltips		$("[rel=tooltip]").tooltip();	})	</script></body></html></cfoutput>