package fx.fabricSampleOrderStatus
{
	[RemoteClass(alias="mochi.cfc.fabricSampleOrderStatus.FabricSampleOrderStatus")]

	[Bindable]
	public class FabricSampleOrderStatus
	{

		public var FabricSampleOrderStatusID:Number = 0;
		public var Status:String = "";
		public var Description:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function FabricSampleOrderStatus()
		{
		}

	}
}