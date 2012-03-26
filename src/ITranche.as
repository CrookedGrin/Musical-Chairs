package {

	public interface ITranche {
		function get value():Number;
		function set value( v:Number ):void;
		function get items():Vector.<*>;
		function addItem( item:* ):void;
		function shuffle():void;
	}
	
}
