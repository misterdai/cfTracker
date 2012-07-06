<cfcomponent extends="mxunit.framework.TestCase" output="false">
	
	<cfscript>
	/*
	---------------------------------------------------------------
	Tests
	---------------------------------------------------------------
	*/
	function getCFMLEngine(){
		var result = CUT.getCFMLEngine();
		AssertTrue( IsObject( result ) );
		AssertEquals( "#enginename#Engine", ListLast( GetMetaData( result ).fullname, "." ) );
		AssertEquals( enginename, result.getProductName() );
	}
	
	function getApplicationNames(){
		var result = CUT.getApplicationNames();
		AssertTrue( IsArray( result ) );
	}
	
	
	/*
	---------------------------------------------------------------
	MXUnit helper methods
	---------------------------------------------------------------
	*/
	function beforeTests(){
	}
	
	function setUp(){
		thisApplicationName = application.metadata.name;
		enginename = UCase( ListFirst( server.coldfusion.productname, " " ) );
		// load the correct subclass for the engine
		CUT = createObject( "component","cftracker.model.engine.CFMLEngineService" ).init();
	}
	
	function tearDown(){
	}
	
	function afterTests(){
	}
	</cfscript>
</cfcomponent>