package fx.images
{
	[RemoteClass(alias="mochi.cfc.images.Image")]

	[Bindable]
	public class Image
	{

		public var ImageID:Number = 0;
		public var EntityTypeID:Number = 0;
		public var EntityID:Number = 0;
		public var Description:String = "";
		public var Location:String = "";
		public var URL:String = "";
		public var ContentType:String = "";
		public var File:String = "";
		public var FileName:String = "";
		public var FileExtension:String = "";
		public var Height:Number = 0;
		public var Width:Number = 0;
		public var FileSize:Number = 0;
		public var ThumbnailFile:String = "";
		public var ThumbnailFileName:String = "";
		public var ThumbnailHeight:Number = 0;
		public var ThumbnailWidth:Number = 0;
		public var CreatedDate:Date = null;
		public var CreatedBy:String = "";
		public var LastMaintainedDate:Date = null;
		public var LastMaintainedBy:String = "";


		public function Image()
		{
		}

	}
}