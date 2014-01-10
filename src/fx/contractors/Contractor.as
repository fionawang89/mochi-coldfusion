package fx.contractors
{
	[RemoteClass(alias="mochi.cfc.contractors.Contractor")]

	[Bindable]
	public class Contractor
	{

		public var ContractorID:Number = 0;
		public var Contractor:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function Contractor()
		{
		}

	}
}