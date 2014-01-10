package fx.entityTypes
{
	[RemoteClass(alias="mochi.cfc.entityTypes.EntityType")]

	[Bindable]
	public class EntityType
	{

		public var EntityTypeID:Number = 0;
		public var EntityType:String = "";
		public var Description:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function EntityType()
		{
		}

	}
}