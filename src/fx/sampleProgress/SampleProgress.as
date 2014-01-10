package fx.sampleProgress
{
	[RemoteClass(alias="mochi.cfc.sampleProgress.SampleProgress")]

	[Bindable]
	public class SampleProgress
	{

		public var SampleProgressID:Number = 0;
		public var SampleRequestID:Number = 0;
		public var ReferenceNumber:Number = 0;
		public var Comments:String = "";
		public var RequestReceived:Number = 0;
		public var RequestReceivedBy:String = "";
		public var RequestReceivedDate:Date = null;
		public var PlanDate:Date = null;
		public var PatternStatusID:Number = 0;
		public var AssignedDate:Date = null;
		public var FinishedDate:Date = null;
		public var StartDate:Date = null;
		public var ApprovedDate:Date = null;
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function SampleProgress()
		{
		}

	}
}