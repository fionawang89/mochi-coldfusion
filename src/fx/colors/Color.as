package fx.colors
{
	[RemoteClass(alias="mochi.cfc.colors.Color")]

	[Bindable]
	public class Color
	{

		public var ColorID:Number = 0;
		public var ColorCode:String = "";
		public var ColorName:String = "";
		public var Description:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function Color()
		{
		}

	}
}