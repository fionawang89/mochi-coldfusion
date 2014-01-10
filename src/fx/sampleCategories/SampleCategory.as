package fx.sampleCategories
{
	[RemoteClass(alias="mochi.cfc.sampleCategories.SampleCategory")]

	[Bindable]
	public class SampleCategory
	{

		public var SampleCategoryID:Number = 0;
		public var Category:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function SampleCategory()
		{
		}

	}
}