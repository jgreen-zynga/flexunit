package org.flexunit.cases
{
	import flexunit.framework.AssertionFailedError;
	
	import org.flexunit.Assert;

	public class AssertCase
	{
		protected var asserterCalled:int = 0;
		
		[Test(description="Ensure that the assertWithApply function correctly runs the function with the parameter array")]
		public function testAssertWithApply():void {
			asserterCalled = 0;
			Assert.assertWithApply( test, [new Object()] );
			Assert.assertEquals( 1, asserterCalled );
		}
		
		[Test(description="Ensure that the assertWith function correct runs the function with the list of paramters")]
		public function testAssertWith():void {
			asserterCalled = 0;
			Assert.assertWith( test, new Object() );
			Assert.assertEquals( 1, asserterCalled );
		}
		
		[Test(description="Ensure that the assertionsMade property returns the correct assertCount")]
		public function testAssertionsMade():void {
			//Reset the fields to ensure the the count is accurate
			Assert.resetAssertionsFields();
			Assert.assertEquals( 0, 0 );
			Assert.assertEquals( Assert.assertionsMade, 1 );
		}
		
		[Test(description="Ensure that the resetAssertionsFields function correctly resets the assertCount")]
		public function testResetAssertionsFields():void {
			Assert.assertEquals( 0, 0 );
			//Ensure that the number of assertions are greater than zero
			Assert.assertTrue( Assert.assertionsMade > 0 );
			//Reset the assertions
			Assert.resetAssertionsFields();
			Assert.assertEquals( Assert.assertionsMade, 0 );
		}
		
		[Test(description="Ensure that the assertEquals function correctly determines if two non-strictly equal items are equal")]
		public function testAssertEquals():void {
			var o:Object = new Object();
			
			Assert.assertEquals( null, null );
			Assert.assertEquals( o, o );
			Assert.assertEquals( 5, 5 );
			Assert.assertEquals( "5", "5" );
			Assert.assertEquals( 5, "5" );
		}
		
		[Test(description="Ensure that the assertEquals function correctly determines if two non-strictly equal items are equal when a message is provided")]
		public function testAssertEqualsWithMessage():void {
			Assert.assertEquals( "Assert equals fail", "5", 5 );
		}
		
		[Test(description="Ensure that the assertEquals function fails when two items are not equal",
			expects="flexunit.framework.AssertionFailedError")]
		public function testAssertEqualsFails():void {
			Assert.assertEquals( 2, 4 );
		}
		
		[Test(description="Ensure that the assertEquals function fails when two items are not equal and the proper passed message is displayed")]
		public function testAssertEqualsWithMessageFails():void {
			var message:String = "Assert equals fail";
			var failed:Boolean = false;
			
			try {
				Assert.assertEquals( message, 2, 4 );
			// if we get an error with the right message we pass
			} catch (error:AssertionFailedError) {
				failed = true;
				Assert.assertEquals( message + " - expected:<2> but was:<4>", error.message );
			}
			if ( !failed ) {
				Assert.fail( "Assert equals didn't fail" );
			}
		}
		
		[Test(description="Ensure that the failNotEquals function correctly determines if two non-strictly equal values are equal")]
		public function testFailNotEquals():void {
			Assert.failNotEquals( "Failure", "5", 5 );
		}
		
		[Test(description="Ensure that the failNotEqula function fails when two values are not equal",
			expects="flexunit.framework.AssertionFailedError")]
		public function testFailNotEqualsFails():void {
			Assert.failNotEquals( "Failure", 2, 4 );
		}
		
		[Test(description="Ensure that the assertStrictlyEquals function correctly determines if two values are strictly equal")]
		public function testAssertStrictlyEquals():void {
			var o:Object = new Object();
			Assert.assertStrictlyEquals( o, o );
		}
		
		[Test(description="Ensure that the assertStrictlyEquals function correctly determines if two values are strictly equal when a message is provided")]
		public function testAssertStrictlyEqualsWithMessage():void {
			var o:Object = new Object();
			Assert.assertStrictlyEquals( "Assert strictly equals fail", o, o );
		}
		
		[Test(description="Ensure that the assertStrictlyEquals function fails when two items are not strictly equal",
			expects="flexunit.framework.AssertionFailedError")]
		public function testAssertStrictlyEqualsFails():void {
			Assert.assertStrictlyEquals( 5, "5" );
		}
		
		[Test(description="Ensure that the assertStrictlyEquals function fails when two items are not strictly euqal and the proper passed message is displayed")]
		public function testAssertStrictlyEqualsWithMessageFails():void {
			var message:String = "Assert strictly equals fail";
			var failed:Boolean = false;
			
			try {
				Assert.assertStrictlyEquals( message, 5, "5" );
				// if we get an error with the right message we pass
			} catch (error:AssertionFailedError) {
				failed = true;
				Assert.assertEquals( message + " - expected:<5> but was:<5>", error.message );
			}
			if ( !failed ) {
				Assert.fail( "Assert strictly equals didn't fail" );
			}
		}
		
		[Test(description="Ensure that the failNotStrictlyEquals function correctly works when two strictly equal values are provided")]
		public function testFailNotStrictlyEquals():void {
			var o:Object = new Object();
			Assert.failNotStrictlyEquals( "Assert strictly equals fail", o, o );
		}
		
		[Test(description="Ensure that the failNotStrictlyEquals function fails when two non-strictly equal values are provided",
			expects="flexunit.framework.AssertionFailedError")]
		public function testFailNotStrictlyEqualsFails():void {
			Assert.failNotStrictlyEquals( "Assert strictly equals fail", 5, "5" );
		}
		
		[Test(description="Ensure that the assertTrue fucntion correctly works when a true value is provided")]
		public function testAssertTrue():void {
			Assert.assertTrue( true );
		}
		
		[Test(description="Ensure that the assertTrue function correctly works when a true value and a message are provided")]
		public function testAssertTrueWithMessage():void {
			Assert.assertTrue( "Assert true fail", true );
		}
		
		[Test(description="Ensure that the assertTrue function fails when a false value is provided",
			expects="flexunit.framework.AssertionFailedError")]
		public function testAssertTrueFails():void {
			Assert.assertTrue( false )
		}
		
		[Test(description="Ensure that the assertTrue functions fails when a false value is provided and the proper passed message is displayed")]
		public function testAssertTrueWithMessageFails():void {
			var message:String = "Assert true fail";
			var failed:Boolean = false;
			
			try {
				Assert.assertTrue( message, false )
				// if we get an error with the right message we pass
			} catch ( error:Error ) {
				failed = true;
				Assert.assertEquals( message + " - expected true but was false", error.message );
			}
			if ( !failed ) {
				Assert.fail( "Assert true didn't fail" );
			}
		}
		
		[Test(description="Ensure that the failNotTrue function correctly works when a value of true is provided")]
		public function testFailNotTrue():void {
			Assert.failNotTrue( "Fail not true fail", true );
		}
		
		[Test(description="Ensure that the failNotTrue function fails when a value of false is provided",
			expects="flexunit.framework.AssertionFailedError")]
		public function testFailNotTrueFails():void {
			Assert.failNotTrue( "Fail not true fail", false );
		}
		
		[Test(description="Ensure that the assertFalse function correctly works when a value of false is provided")]
		public function testAssertFalse():void {
			Assert.assertFalse( false );
		}
		
		[Test(description="Ensure that the assertFalse function correctly works when a value of false and a message are provided")]
		public function testAssertFalseWithMessage():void {
			Assert.assertFalse( "Assert false fail", false );
		}
		
		[Test(description="Ensure that the assertFalse function fails when a value of true is provided",
			expects="flexunit.framework.AssertionFailedError")]
		public function testAssertFalseFails():void {
			Assert.assertFalse( true )
		}
		
		[Test(description="Ensure that the assertFalse function fails when a value of true is provided and the proper message is displayed")]
		public function testAssertFalseWithMessageFails():void {
			var message:String = "Assert false fail";
			var failed:Boolean = false;
			
			try {
				Assert.assertFalse( message, true )
				// if we get an error with the right message we pass
			} catch ( error:Error ) {
				failed = true;
				Assert.assertEquals( message + " - expected false but was true", error.message );
			}
			if ( !failed ) {
				Assert.fail( "Assert false didn't fail" );
			}
		}
		
		[Test(description="Ensure that the failTrue function correctly works when a value of false is provided")]
		public function testFailTrue():void {
			Assert.failTrue( "Fail true fail", false );
		}
		
		[Test(description="Ensure that the failTrue function fails when a value of true is provided",
			expects="flexunit.framework.AssertionFailedError")]
		public function testFailTrueFails():void {
			Assert.failTrue( "Fail true fail", true );
		}
		
		[Test(description="Ensure that the assertNull function correctly works when a value of null is provided")]
		public function testAssertNull():void {
			Assert.assertNull( null );
		}
		
		[Test(description="Ensure that the assertNull function correctly works when a value of null and a message are provided")]
		public function testAssertNullWithMessage():void {
			Assert.assertNull( "Assert null fail", null );
		}
		
		[Test(description="Ensure that the assertNull function fails when a non-null value is provided",
			expects="flexunit.framework.AssertionFailedError")]
		public function testAssertNullFails():void {
			var o:Object = new Object();
			Assert.assertNull( o )
		}
		
		[Test(description="Ensure that the assertNull functions fails when a non-null value is provided an the proper message is displayed")]
		public function testAssertNullWithMessageFails():void {
			var o:Object = new Object();
			var failed:Boolean = false;
			var message:String = "Assert null fail";
			try {
				Assert.assertNull( message, o )
				// if we get an error with the right message we pass
			} catch ( error:AssertionFailedError ) {
				failed = true;
				Assert.assertEquals( message + " - object was not null: [object Object]", error.message );
			}
			if ( !failed ) {
				Assert.fail( "Assert null didn't fail" );
			}
		}
		
		[Test(description="Ensure that the failNull function works correctly when a non-null value is provided")]
		public function testFailNull():void {
			var o:Object = new Object();
			Assert.failNull( "Fail null fail", o );
		}
		
		[Test(description="Ensure that the failNull function fails when a null value is provided",
			expects="flexunit.framework.AssertionFailedError")]
		public function testFailNullFails():void {
			Assert.failNull( "Fail null fail", null );
		}
		
		[Test(description="Ensure the the assertNotNull function correctly works when a non-null value is provided")]
		public function testAssertNotNull():void {
			var o:Object = new Object();
			Assert.assertNotNull( o );
		}
		
		[Test(description="Ensure that the assertNotNull function correctly works when a non-null value and a message are provided")]
		public function testAssertNotNullWithMessage():void {
			var o:Object = new Object();
			Assert.assertNotNull( "Assert not null fail", o );
		}
		
		[Test(description="Ensure that the assertNotNull function fails when a null value is provided",
			expects="flexunit.framework.AssertionFailedError")]
		public function testAssertNotNullFails():void {
			Assert.assertNotNull( null )
		}
		
		[Test(description="Ensure that the assertNotNull function fails when a null value is provided and the proper message is displayed")]
		public function testAssertNotNullWithMessageFails():void {
			var failed:Boolean = false;
			var message:String = "Assert not null fail";
			try {
				Assert.assertNotNull( message, null )
				// if we get an error with the right message we pass
			} catch ( error:AssertionFailedError ) {
				failed = true;
				Assert.assertEquals( message + " - object was null: null", error.message );
			}
			if ( !failed ) {
				Assert.fail( "Assert not null didn't fail" );
			}
		}
		
		[Test(description="Ensure that the failNotNull function works correctly when a null value is provided")]
		public function testFailNotNull():void {
			Assert.failNotNull( "Fail not null fail", null );
		}
		
		[Test(description="Ensure that the failNotNull function fails when a non-null value is provided",
			expects="flexunit.framework.AssertionFailedError")]
		public function testFailNotNullFails():void {
			var o:Object = new Object();
			Assert.failNotNull( "Fail not null fail", o );
		}
		
		[Test(description="Ensure that the testFail function correctly throws an AssertionFailedError and sends the proper message")]
		public function testFail():void {
			var message:String = "Fail test";
			var failed:Boolean = false;
			
			try {
				Assert.fail(message);
			} catch(error:AssertionFailedError) {
				failed = true;
				Assert.assertEquals( message, error.message );
			}
			if(!failed) {
				Assert.fail("The fail function has failed");
			}
		}
		
		protected function test( obj:Object ):void {
			asserterCalled++;
		}
	}
}