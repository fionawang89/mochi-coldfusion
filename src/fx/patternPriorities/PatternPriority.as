package fx.patternPriorities
{
	[RemoteClass(alias="mochi.cfc.patternPriorities.PatternPriority")]

	[Bindable]
	public class PatternPriority
	{

		public var PatternPriorityID:Number = 0;
		public var PriorityCode:String = "";
		public var Description:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function PatternPriority()
		{
		}

	}
}