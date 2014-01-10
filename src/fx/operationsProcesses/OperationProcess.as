package fx.operationsProcesses
{
	[RemoteClass(alias="mochi.cfc.operationsProcesses.OperationProcess")]

	[Bindable]
	public class OperationProcess
	{

		public var OperationProcessID:Number = 0;
		public var ProcessID:Number = 0;
		public var OperationID:Number = 0;
		public var Sequence:Number = 0;
		public var Dependency:Number = 0;
		public var PersonInCharge:String = "";
		public var PercentDaysToFinish:Number = 0;
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function OperationProcess()
		{
		}

	}
}