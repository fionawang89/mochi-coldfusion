package fabricLabDipStatus
{
	[RemoteClass(alias="mochi.cfc.fabricLabDipStatus.FabricLabDipStatus")]

	[Bindable]
	public class FabricLabDipStatus
	{

		public var FabricLabDipStatusID:Number = 0;
		public var Status:String = "";
		public var Description:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function FabricLabDipStatus()
		{
		}

	}
}