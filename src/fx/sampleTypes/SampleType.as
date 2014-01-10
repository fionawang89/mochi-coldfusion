package fx.sampleTypes
{
	[RemoteClass(alias="mochi.cfc.sampleTypes.SampleType")]

	[Bindable]
	public class SampleType
	{

		public var SampleTypeID:Number = 0;
		public var SampleType:String = "";
		public var Description:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function SampleType()
		{
		}

	}
}