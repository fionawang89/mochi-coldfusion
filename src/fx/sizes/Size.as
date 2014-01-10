package fx.sizes
{
	[RemoteClass(alias="mochi.cfc.sizes.Size")]

	[Bindable]
	public class Size
	{

		public var SizeID:Number = 0;
		public var Size:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function Size()
		{
		}

	}
}