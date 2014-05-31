package com.findingpolandball.dao 
{
	/**
	 * ...
	 * @author Denzil Daulo
	 */
	public class CountryBallDao 
	{
		private var countryBalls:Array = [
										  [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 13, 14, 15, 16, 17, 18, 19, 20],
										  [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 1, 12, 13, 14, 15, 16, 17, 19, 20, 19, 20],
										  [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 19, 20, 1, 19, 20, 3],
										  [2, 3, 4, 5, 6, 7, 8, 9, 1, 10, 11, 12, 13, 14, 15, 19, 20, 2, 13, 19, 20],
										  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 19, 20, 6, 7, 8, 9, 10, 11],
										  [2, 3, 4, 5, 6, 19, 7, 8, 9, 10, 11, 12, 1, 13, 19, 20, 2, 3, 4, 5, 6, 19,],
										  [2, 3, 4, 5, 6, 7, 8, 9, 1, 10, 11, 12, 19, 20, 2, 3, 4, 5, 6, 7, 8, 9, 12],
										  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 19, 20, 20, 2, 3, 4, 5, 20, 2, 3, 4, 5],
										  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 19, 20, 2, 3, 4, 5, 6, 7, 8, 9, 10, 19, 20],
										  [2, 3, 4, 5, 6, 7, 8, 9, 1, 19, 20, 2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5, 6],
										  [2, 3, 1, 4, 5, 6, 7, 8, 19, 20, 4, 5, 6, 7, 8, 19, 20, 4, 5, 6, 7, 8, 19],
										  [2, 3, 4, 1, 5, 6, 7, 19, 20, 5, 6, 7, 19, 20, 5, 6, 7, 19, 20, 5, 6, 7, 19],
										  [2, 3, 4, 5, 6, 19, 1, 20, 2, 3, 4, 5, 6, 19, 20, 2, 3, 4, 5, 6, 19, 20, 2, 3],
										  [2, 3, 1, 4, 5, 19, 20, 2, 3, 4, 5, 19, 20, 2, 3, 4, 5, 19, 20, 2, 3, 4, 5, 19],
										  [2, 3, 4, 1, 6, 19, 20, 2, 3, 4, 6, 19, 20, 2, 3, 4, 6, 19, 20, 2, 3, 4, 6, 19],
										  [2, 3, 4, 19, 1, 20, 2, 3, 4, 19, 20, 2, 3, 4, 19, 20, 2, 3, 4, 19, 20, 2, 3],
										  [1, 2, 3, 19, 20, 2, 3, 19, 20, 2, 3, 19, 20, 2, 3, 19, 20, 2, 3, 19, 20, 2, 3],
										  [3, 19, 1, 20, 19, 3, 20, 19, 3, 20, 19, 3, 20, 19, 3, 20, 19, 3, 20, 19, 3, 20],
										  [19, 20 , 1, 19, 20, 19, 20, 19, 20, 19, 20, 19, 20, 19, 20, 19, 20, 19, 20, 19],
										  [19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 1, 19, 19, 19, 19, 19, 19, 19, 19],
										  [20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 1, 20, 20, 20, 20, 20, 20, 20, 20],
										 ];
		private var level:int;
		public function CountryBallDao() 
		{
			
		}
		
		public function setLevel(level:int):void {
				this.level = level;
				if (this.level > countryBalls.length) {
					this.level = level % countryBalls.length;
					trace("postModLevel:" + this.level);
				}
		}
		
		public function getCountryBallsLength():int {
			return countryBalls.length;
		}
		
		public function getLevel():Array {
			trace("level:" + level );
			trace("countryBalls[level-1]:" + countryBalls[level - 1));
			return countryBalls[level-1];
		}
	}

}