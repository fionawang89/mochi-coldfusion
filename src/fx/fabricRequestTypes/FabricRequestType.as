package fx.fabricRequestTypes
{
	[RemoteClass(alias="mochi.cfc.fabricRequestTypes.FabricRequestType")]

	[Bindable]
	public class FabricRequestType
	{

		public var FabricRequestTypeID:Number = 0;
		public var Type:String = "";
		public var Description:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function FabricRequestType()
		{
		}

	}
}