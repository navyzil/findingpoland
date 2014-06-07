package com.findingpolandball.dao 
{
	/**
	 * ...
	 * @author Denzil Daulo
	 */
	public class CountryBallDao 
	{
		private var countryBalls:Array = [
										  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
										   21, 22, 23, 24, 25, 26]
										 ];
		private var level:int;
		public function CountryBallDao() 
		{
			
		}
		
		public function setLevel(level:int):void {
				this.level = level;
		}
		
		public function getCountryBallsLength():int {
			return countryBalls.length;
		}
		
		public function getLevel():Array {
			return countryBalls[0];
		}
	}

}