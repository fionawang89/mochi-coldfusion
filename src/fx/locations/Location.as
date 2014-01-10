package fx.locations
{
	[RemoteClass(alias="mochi.cfc.locations.Location")]

	[Bindable]
	public class Location
	{

		public var LocationID:Number = 0;
		public var Location:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function Location()
		{
		}

	}
}