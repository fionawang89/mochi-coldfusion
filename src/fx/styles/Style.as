package fx.styles
{
	[RemoteClass(alias="mochi.cfc.styles.Style")]

	[Bindable]
	public class Style
	{

		public var StyleID:Number = 0;
		public var EntityTypeID:Number = 0;
		public var StyleName:String = "";
		public var Description:String = "";
		public var ProductionTeamLeader:String = "";
		public var ProductionPatternMaker:String = "";
		public var FirstPatternMaker:String = "";
		public var CareInformation:String = "";
		public var PatternDifficulty:String = "";
		public var PatternReference:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function Style()
		{
		}

	}
}