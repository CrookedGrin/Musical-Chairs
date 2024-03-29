package {
	import flash.geom.Point;

	public class SeatXRef {

		public var seatA:Seat;
		public var seatB:Seat;
		protected var cachedDelta:Number;

		public function SeatXRef(a:Seat, b:Seat) {
			
			seatA = a;
			seatB = b;
			
			// link this object back to each of the points, so they can access all their own relevant xRefs
			seatA.addXRef(this);
			seatB.addXRef(this);
			
			// TODO: add listeners to the position of seats to recalculate distance when positions change
		}
		
		public function get delta():Number {
			if (isNaN(cachedDelta)) {
				cachedDelta =  calculateDelta();
			}
			return cachedDelta;
		}
		
		/**
		 * This method should only be called internally until the points change position
		 * Otherwise, cached distance should be accessed via distance getter
		 */
		public function calculateDelta():Number {
			return Point.distance(seatA.coords, seatB.coords);
		}
		
		
	}
}
