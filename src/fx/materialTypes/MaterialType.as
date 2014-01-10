package fx.materialTypes
{
	[RemoteClass(alias="mochi.cfc.materialTypes.MaterialType")]

	[Bindable]
	public class MaterialType
	{

		public var MaterialTypeID:Number = 0;
		public var MaterialType:String = "";
		public var Description:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function MaterialType()
		{
		}

	}
}