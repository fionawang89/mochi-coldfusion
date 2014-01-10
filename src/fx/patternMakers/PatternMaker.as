package fx.patternMakers
{
	[RemoteClass(alias="mochi.cfc.patternMakers.PatternMaker")]

	[Bindable]
	public class PatternMaker
	{

		public var PatternMakerID:Number = 0;
		public var FirstName:String = "";
		public var LastName:String = "";
		public var LocationID:Number = 0;
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function PatternMaker()
		{
		}

	}
}