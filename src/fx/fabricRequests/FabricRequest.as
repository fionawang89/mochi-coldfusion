package fx.fabricRequests
{
	[RemoteClass(alias="mochi.cfc.fabricRequests.FabricRequest")]

	[Bindable]
	public class FabricRequest
	{

		public var FabricRequestID:Number = 0;
		public var EntityTypeID:Number = 0;
		public var ReferenceNumber:Number = 0;
		public var DeliveryID:Number = 0;
		public var YearID:Number = 0;
		public var FabricID:Number = 0;
		public var ColorID:Number = 0;
		public var PantoneColor:String = "";
		public var Comments:String = "";
		public var RequestedBy:String = "";
		public var RequestDate:Date = null;
		public var ApprovedBy:String = "";
		public var ApprovedDate:Date = null;
		public var ReceivedBy:String = "";
		public var ReceivedDate:Date = null;
		public var FabricRequestStatusID:Number = 0;
		public var FabricRequestTypeID:Number = 0;
		public var FabricCategoryID:Number = 0;
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function FabricRequest()
		{
		}

	}
}