package fx.sampleRequests
{
	[RemoteClass(alias="mochi.cfc.sampleRequests.SampleRequest")]

	[Bindable]
	public class SampleRequest
	{

		public var SampleRequestID:Number = 0;
		public var ReferenceNumber:Number = 0;
		public var CollectionID:Number = 0;
		public var SampleTypeID:Number = 0;
		public var StyleID:Number = 0;
		public var ColorID:Number = 0;
		public var SizeID:Number = 0;
		public var Customer:String = "";
		public var Quantity:Number = 0;
		public var Comments:String = "";
		public var RequestedBy:String = "";
		public var RequestedFor:String = "";
		public var RequestDate:Date = null;
		public var DueDate:Date = null;
		public var PatternDueDate:Date = null;
		public var DeadlineToContractor:Date = null;
		public var ReceivedDate:Date = null;
		public var RequestStatusID:Number = 0;
		public var MakeIn:String = "";
		public var RequestSubmitted:Number = 0;
		public var ContractorID:Number = 0;
		public var HasOrder:Number = 0;
		public var YearID:Number = 0;
		public var DeliveryID:Number = 0;
		public var CancellationDate:Date = null;
		public var CancelledBy:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function SampleRequest()
		{
		}

	}
}