package fx.fabricRequestStatus
{
	[RemoteClass(alias="mochi.cfc.fabricRequestStatus.FabricRequestStatus")]

	[Bindable]
	public class FabricRequestStatus
	{

		public var FabricRequestStatusID:Number = 0;
		public var Status:String = "";
		public var Description:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function FabricRequestStatus()
		{
		}

	}
}