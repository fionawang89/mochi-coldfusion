package fx.fittings
{
	[RemoteClass(alias="mochi.cfc.fittings.Fitting")]

	[Bindable]
	public class Fitting
	{

		public var FittingID:Number = 0;
		public var StyleID:Number = 0;
		public var SampleCategoryID:Number = 0;
		public var PatternMakerID:Number = 0;
		public var CutNumber:Number = 0;
		public var DueDate:Date = null;
		public var LocationID:Number = 0;
		public var ContractorID:Number = 0;
		public var Fitter:String = "";
		public var FittingDate:Date = null;
		public var ResultCodeID:Number = 0;
		public var PatternStatusID:Number = 0;
		public var Comments:String = "";
		public var CreatedDate:Date = null;
		public var CreatedBy:String = "";
		public var LastMaintainedDate:Date = null;
		public var LastMaintainedBy:String = "";


		public function Fitting()
		{
		}

	}
}