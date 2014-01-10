package fx.videos
{
	[RemoteClass(alias="mochi.cfc.videos.Video")]

	[Bindable]
	public class Video
	{

		public var VideoID:Number = 0;
		public var EntityTypeID:Number = 0;
		public var EntityID:Number = 0;
		public var Description:String = "";
		public var Location:String = "";
		public var URL:String = "";
		public var ContentType:String = "";
		public var File:String = "";
		public var FileName:String = "";
		public var FileExtension:String = "";
		public var FileSize:Number = 0;
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function Video()
		{
		}

	}
}