package fx.vendors
{
	[RemoteClass(alias="mochi.cfc.vendors.Vendor")]

	[Bindable]
	public class Vendor
	{

		public var VendorID:Number = 0;
		public var Vendor:String = "";
		public var ContactName:String = "";
		public var TelephoneNumber:String = "";
		public var FaxNumber:String = "";
		public var EMail:String = "";
		public var Address:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function Vendor()
		{
		}

	}
}