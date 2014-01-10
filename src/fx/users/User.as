package fx.users
{
	[RemoteClass(alias="mochi.cfc.users.User")]

	[Bindable]
	public class User
	{

		public var UserID:Number = 0;
		public var FirstName:String = "";
		public var LastName:String = "";
		public var Email:String = "";
		public var Password:String = "";
		public var Roles:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function User()
		{
		}

	}
}