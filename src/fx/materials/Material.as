package fx.materials
{
	[RemoteClass(alias="mochi.cfc.materials.Material")]

	[Bindable]
	public class Material
	{

		public var MaterialID:Number = 0;
		public var EntityTypeID:Number = 0;
		public var MaterialCode:String = "";
		public var Description:String = "";
		public var MaterialTypeID:Number = 0;
		public var MaterialCategoryID:Number = 0;
		public var Width:String = "";
		public var Content:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function Material()
		{
		}

	}
}