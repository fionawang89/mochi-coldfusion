package fx.fabricSampleOrders
{
	[RemoteClass(alias="mochi.cfc.fabricSampleOrders.FabricSampleOrder")]

	[Bindable]
	public class FabricSampleOrder
	{

		public var FabricSampleOrderID:Number = 0;
		public var VendorID:Number = 0;
		public var FabricRequestID:Number = 0;
		public var OrderedBy:String = "";
		public var OrderDate:Date = null;
		public var EstimateShipDate:Date = null;
		public var SampleYardage:Number = 0;
		public var CostPerYard:Number = 0;
		public var TotalCost:Number = 0;
		public var CostCurrency:String = "";
		public var ReceivedBy:String = "";
		public var ReceivedDate:Date = null;
		public var ReceivedQuantity:Number = 0;
		public var CancelledBy:String = "";
		public var CancelledDate:Date = null;
		public var Comments:String = "";
		public var FabricSampleOrderStatusID:Number = 0;
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function FabricSampleOrder()
		{
		}

	}
}