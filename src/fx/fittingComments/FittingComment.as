package fx.fittingComments
{
	[RemoteClass(alias="mochi.cfc.fittingComments.FittingComment")]

	[Bindable]
	public class FittingComment
	{

		public var FittingCommentID:Number = 0;
		public var FittingID:Number = 0;
		public var Comment:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function FittingComment()
		{
		}

	}
}