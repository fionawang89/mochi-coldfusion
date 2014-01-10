package fx.videoComments
{
	[RemoteClass(alias="mochi.cfc.videoComments.VideoComment")]

	[Bindable]
	public class VideoComment
	{

		public var VideoCommentID:Number = 0;
		public var VideoID:Number = 0;
		public var Comment:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function VideoComment()
		{
		}

	}
}