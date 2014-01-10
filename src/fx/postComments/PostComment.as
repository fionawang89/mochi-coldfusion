package src.fx.postComments
{
	[RemoteClass(alias="src.cfc.postComments.PostComment")]

	[Bindable]
	public class PostComment
	{

		public var PostCommentID:Number = 0;
		public var PostID:Number = 0;
		public var Comment:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function PostComment()
		{
		}

	}
}