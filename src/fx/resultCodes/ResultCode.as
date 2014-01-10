package fx.resultCodes
{
	[RemoteClass(alias="mochi.cfc.resultCodes.ResultCode")]

	[Bindable]
	public class ResultCode
	{

		public var ResultCodeID:Number = 0;
		public var Code:String = "";
		public var Description:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function ResultCode()
		{
		}

	}
}