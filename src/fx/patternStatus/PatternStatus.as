package fx.patternStatus
{
	[RemoteClass(alias="mochi.cfc.patternStatus.PatternStatus")]

	[Bindable]
	public class PatternStatus
	{

		public var PatternStatusID:Number = 0;
		public var Status:String = "";
		public var Description:String = "";
		public var Type:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function PatternStatus()
		{
		}

	}
}