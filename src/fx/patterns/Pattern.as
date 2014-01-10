package fx.patterns
{
	[RemoteClass(alias="mochi.cfc.patterns.Pattern")]

	[Bindable]
	public class Pattern
	{

		public var PatternID:Number = 0;
		public var FittingID:Number = 0;
		public var Description:String = "";
		public var DueDate:Date = null;
		public var PatternPriorityID:Number = 0;
		public var PatternStatusID:Number = 0;
		public var Approved:Number = 0;
		public var ApprovedBy:String = "";
		public var ApprovedWhen:Date = null;
		public var Location:String = "";
		public var URL:String = "";
		public var ContentType:String = "";
		public var File:String = "";
		public var FileName:String = "";
		public var FileExtension:String = "";
		public var FileSize:Number = 0;
		public var CreatedDate:Date = null;
		public var CreatedBy:String = "";
		public var LastMaintainedDate:Date = null;
		public var LastMaintainedBy:String = "";


		public function Pattern()
		{
		}

	}
}