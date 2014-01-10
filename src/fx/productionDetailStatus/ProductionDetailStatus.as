package fx.productionDetailStatus
{
	[RemoteClass(alias="mochi.cfc.productionDetailStatus.ProductionDetailStatus")]

	[Bindable]
	public class ProductionDetailStatus
	{

		public var ProductionDetailStatusID:Number = 0;
		public var Status:String = "";
		public var StatusCode:String = "";
		public var Description:String = "";
		public var OperationID:Number = 0;
		public var Type:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function ProductionDetailStatus()
		{
		}

	}
}