package fx.artworks
{
	[RemoteClass(alias="mochi.cfc.artworks.Artwork")]

	[Bindable]
	public class Artwork
	{

		public var ArtworkID:Number = 0;
		public var EntityTypeID:Number = 0;
		public var ArtworkName:String = "";
		public var Description:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function Artwork()
		{
		}

	}
}