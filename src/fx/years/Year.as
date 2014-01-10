package fx.years
{
	[RemoteClass(alias="mochi.cfc.years.Year")]

	[Bindable]
	public class Year
	{

		public var YearID:Number = 0;
		public var Year:String = "";
		public var Description:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function Year()
		{
		}

	}
}