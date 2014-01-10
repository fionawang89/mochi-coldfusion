package fx.customers
{
	[RemoteClass(alias="mochi.cfc.customers.Customer")]

	[Bindable]
	public class Customer
	{

		public var CustomerID:Number = 0;
		public var Customer:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function Customer()
		{
		}

	}
}