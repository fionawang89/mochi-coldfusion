package fx.fabricLabDips
{
	[RemoteClass(alias="mochi.cfc.fabricLabDips.FabricLabDip")]

	[Bindable]
	public class FabricLabDip
	{

		public var FabricLabDipID:Number = 0;
		public var FabricRequestID:Number = 0;
		public var LabDipSubmit:Number = 0;
		public var SubmitBy:String = "";
		public var SubmitDate:Date = null;
		public var ReceivedBy:String = "";
		public var ReceivedDate:Date = null;
		public var ApprovedBy:String = "";
		public var ApprovedDate:Date = null;
		public var FabricLabDipStatusID:Number = 0;
		public var Comments:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function FabricLabDip()
		{
		}

	}
}