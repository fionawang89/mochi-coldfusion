package fx.sampleShipments
{
	[RemoteClass(alias="mochi.cfc.sampleShipments.SampleShipment")]

	[Bindable]
	public class SampleShipment
	{

		public var SampleShipmentID:Number = 0;
		public var SampleRequestID:Number = 0;
		public var ReferenceNumber:Number = 0;
		public var Comments:String = "";
		public var AttentionTo:String = "";
		public var Sender:String = "";
		public var BeforeShipmentStatus:Number = 0;
		public var ShippedDate:Date = null;
		public var ShippedVia:String = "";
		public var TrackingNumber:String = "";
		public var ShipmentStatus:String = "";
		public var ReceivedBy:String = "";
		public var ReceivedDate:Date = null;
		public var ShipFrom:String = "";
		public var ShipTo:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function SampleShipment()
		{
		}

	}
}