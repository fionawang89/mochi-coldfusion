package fx.materialCategories
{
	[RemoteClass(alias="mochi.cfc.materialCategories.MaterialCategory")]

	[Bindable]
	public class MaterialCategory
	{

		public var MaterialCategoryID:Number = 0;
		public var Category:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function MaterialCategory()
		{
		}

	}
}