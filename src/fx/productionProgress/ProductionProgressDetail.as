package fx.productionProgress
{
	[RemoteClass(alias="mochi.cfc.productionProgress.ProductionProgressDetail")]

	[Bindable]
	public class ProductionProgressDetail
	{

		public var ProductionProgressDetailID:Number = 0;
		public var ProductionProgressID:Number = 0;
		public var OperationProcessID:Number = 0;
		public var FinishedDate:Date = null;
		public var PlanDate:Date = null;
		public var ProductionDetailStatusID:Number = 0;
		public var Status:String = "";
		public var Comments:String = "";
		public var Revision:Number = 0;
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function ProductionProgressDetail()
		{
		}

	}
}