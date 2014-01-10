package fx.productionStatus
{
	[RemoteClass(alias="mochi.cfc.productionStatus.ProductionStatus")]

	[Bindable]
	public class ProductionStatus
	{

		public var ProductionStatusID:Number = 0;
		public var Status:String = "";
		public var Description:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function ProductionStatus()
		{
		}

	}
}