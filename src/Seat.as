package {
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	
	import mx.core.UIComponent;
	
	import spark.components.Label;

	public class Seat {
		
		public var id:int;
		public var coords:Point;
		public var student:Student;
		public var xRefs:Vector.<SeatXRef>;
		
		protected var uiComp:UIComponent;
		protected var sprite:Sprite;
		protected var label:TextField;
		
		public static const SEAT_SIZE:Number = 100;
		
		public function Seat() {
			xRefs = new Vector.<SeatXRef>;
		}
		
		public function get display():UIComponent {
			
			if (!uiComp) {
				uiComp = new UIComponent();
			}
			
			if (!sprite) {
				sprite = new Sprite();
				sprite.graphics.beginFill(0xFF0000, 0.5);
				sprite.graphics.drawCircle(SEAT_SIZE/2, SEAT_SIZE/2, SEAT_SIZE/2);
				sprite.graphics.endFill();
				uiComp.addChild(sprite);
			}
			
			if (!label) {
				label = new TextField();
				label.width = SEAT_SIZE;
//				label.setStyle("fontAlign", "center");
				label.x = SEAT_SIZE - label.width/2;
				label.y = SEAT_SIZE - label.height/2;
				label.text = id.toString();
				uiComp.addChild(label);
			}
			
			return uiComp;
			
		}
		
		public function addXRef(xRef:SeatXRef):void {
			// TODO: add contains check, if this ever gets called more than once for each xref at creation
			xRefs.push(xRef);
		}

		public function setStudent( s:Student ):void {
			
			student = s;
			label.text = student.name;
		}
		
	}
}
