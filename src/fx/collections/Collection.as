package fx.collections
{
	[RemoteClass(alias="mochi.cfc.collections.Collection")]

	[Bindable]
	public class Collection
	{

		public var CollectionID:Number = 0;
		public var Collection:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function Collection()
		{
		}

	}
}