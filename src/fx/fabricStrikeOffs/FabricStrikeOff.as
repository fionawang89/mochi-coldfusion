package fx.fabricStrikeOffs
{
	[RemoteClass(alias="mochi.cfc.fabricStrikeOffs.FabricStrikeOff")]

	[Bindable]
	public class FabricStrikeOff
	{

		public var FabricStrikeOffID:Number = 0;
		public var FabricRequestID:Number = 0;
		public var StrikeOffSubmit:Number = 0;
		public var SubmitBy:String = "";
		public var SubmitDate:Date = null;
		public var ReceivedBy:String = "";
		public var ReceivedDate:Date = null;
		public var ApprovedBy:String = "";
		public var ApprovedDate:Date = null;
		public var FabricRequestStatusID:Number = 0;
		public var Comments:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function FabricStrikeOff()
		{
		}

	}
}