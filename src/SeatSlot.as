package {
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import mx.core.UIComponent;
	import flash.geom.Point;
	import flash.display.Sprite;

	public class SeatSlot extends EventDispatcher {
		
		public var id:int;
		public var rowIndex:int;
		public var colIndex:int;
		public var coords:Point; // on-screen x-y position

		protected var uiComp:UIComponent;
		protected var bgSprite:Sprite;
		
		public function SeatSlot() {
			
		}
	}
}
