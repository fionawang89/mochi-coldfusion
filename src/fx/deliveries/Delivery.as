package fx.deliveries
{
	[RemoteClass(alias="mochi.cfc.deliveries.Delivery")]

	[Bindable]
	public class Delivery
	{

		public var DeliveryID:Number = 0;
		public var Delivery:String = "";
		public var Description:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function Delivery()
		{
		}

	}
}