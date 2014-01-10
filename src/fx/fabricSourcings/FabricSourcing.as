package fx.fabricSourcings
{
	[RemoteClass(alias="mochi.cfc.fabricSourcings.FabricSourcing")]

	[Bindable]
	public class FabricSourcing
	{

		public var FabricSourcingID:Number = 0;
		public var FabricRequestID:Number = 0;
		public var VendorID:Number = 0;
		public var RequestedBy:String = "";
		public var RequestDate:Date = null;
		public var Minimum:Number = 0;
		public var USDPrice:Number = 0;
		public var RMBPrice:Number = 0;
		public var Comments:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function FabricSourcing()
		{
		}

	}
}