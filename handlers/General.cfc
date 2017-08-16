component {	property name="messageBox" inject="messagebox@cbmessagebox";	property name="sessionStorage" inject="sessionStorage@cbstorages";	function onRequestStart() {		// Set xeh's		rc.xehLogout = "General.doLogout";		rc.xehHome = "General.Home";	}	function Login() {		// Set xeh's		rc.xehLogin = "General.doLogin";		// Set the page's title		rc.title = "Login Assignment";		/*			The view "general/login" will be used by convention for this event			because of the handler name "general" and the event name "login".			Alternatly, you can manually set the view using			Event.setView("general/login");		*/	}	function doLogin() {		// Do Login Procedure.		var objDataStore = "";		var ValidationStruct = "";		// Error checks, does the form variables username & password exist		// in the request collection? if they do, are they blank?		if( not Event.valueExists("username") or not Event.valueExists("password") ){			// Set a message to display			messageBox.error("No username or password defined.");			log.error("Login without variables set detected.");			// Redirect to next event, you can also add extra parameters to the URL			setNextEvent(event="General.Login",queryString="username=#Event.getValue("username","")#");		}		else{			// Init DataStorage			objDataStore = getInstance( 'datastore' );			ValidationStruct = objDataStore.validateUser(rc.username, rc.password);			if ( ValidationStruct.validated ){				// Login Correct.				// set my session vars				sessionStorage.setVar("loggedin",true);				sessionStorage.setVar("name",ValidationStruct.qUser.name);				// Log the entry				log.info("The user #validationStruct.qUser.name# has now logged in.");				// relocate to home page.				setNextEvent("General.Home");			}			else{				// Set a message to display				messageBox.error("Invalid Logon Information. Please try again");				log.warn("Invalid logon information detected. IP used: #cgi.remote_addr#");				// Redirect to next event, you can also add extra parameters to the URL				setNextEvent(event="General.Login",queryString="username=#Event.getValue("username")#");			}		}	}	function Home() {		// Set the page's title		rc.title = "Login Assignmen";		/*			The view "general/home" will be used by convention for this event			because of the handler name "general" and the event name "home".			Alternatly, you can manually set the view using			Event.setView("general/home");		*/	}	function doLogout() {		// Delete login Information		sessionStorage.clearAll();		// Set the next event to display		setNextEvent("General.Login");	}}