package fx.requestStatus
{
	[RemoteClass(alias="mochi.cfc.requestStatus.RequestStatus")]

	[Bindable]
	public class RequestStatus
	{

		public var RequestStatusID:Number = 0;
		public var Status:String = "";
		public var Description:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function RequestStatus()
		{
		}

	}
}