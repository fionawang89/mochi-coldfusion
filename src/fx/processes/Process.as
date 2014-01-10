package fx.processes
{
	[RemoteClass(alias="mochi.cfc.processes.Process")]

	[Bindable]
	public class Process
	{

		public var ProcessID:Number = 0;
		public var Process:String = "";
		public var Description:String = "";
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function Process()
		{
		}

	}
}