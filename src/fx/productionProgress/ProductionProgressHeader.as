package fx.productionProgress
{
	[RemoteClass(alias="mochi.cfc.productionProgress.ProductionProgressHeader")]

	[Bindable]
	public class ProductionProgressHeader
	{

		public var ProductionProgressID:Number = 0;
		public var CompanyNumber:Number = 0;
		public var CutNumber:Number = 0;
		public var Style:String = "";
		public var Color:String = "";
		public var IssueDate:Date = null;
		public var DueDate:Date = null;
		public var Issued:Number = 0;
		public var TotalWorkDays:Number = 0;
		public var Contractor:String = "";
		public var Status:Number = 0;
		public var Comments:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function ProductionProgressHeader()
		{
		}

	}
}