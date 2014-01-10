package fx.operations
{
	[RemoteClass(alias="mochi.cfc.operations.Operation")]

	[Bindable]
	public class Operation
	{

		public var OperationID:Number = 0;
		public var Operation:String = "";
		public var OperationCode:String = "";
		public var Description:String = "";
		public var RequireDocument:Number = 0;
		public var CreatedBy:String = "";
		public var CreatedDate:Date = null;
		public var LastMaintainedBy:String = "";
		public var LastMaintainedDate:Date = null;


		public function Operation()
		{
		}

	}
}