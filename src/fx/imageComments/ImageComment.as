package fx.imageComments
{
	[RemoteClass(alias="mochi.cfc.imageComments.ImageComment")]

	[Bindable]
	public class ImageComment
	{

		public var ImageCommentID:Number = 0;
		public var ImageID:Number = 0;
		public var Comment:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function ImageComment()
		{
		}

	}
}