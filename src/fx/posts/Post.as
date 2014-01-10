package fx.posts
{
	[RemoteClass(alias="mochi.cfc.posts.Post")]

	[Bindable]
	public class Post
	{

		public var PostID:Number = 0;
		public var Subject:String = "";
		public var Post:String = "";
		public var Done:Number = 0;
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";


		public function Post()
		{
		}

	}
}