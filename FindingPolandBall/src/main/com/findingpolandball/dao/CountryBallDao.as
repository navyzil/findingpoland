package com.findingpolandball.dao 
{
	/**
	 * ...
	 * @author Denzil Daulo
	 */
	public class CountryBallDao 
	{
		private var countryBalls:Array = [];
										  //[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
										   //21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 32, 35, 36, 37, 38,
										   //39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56,
										   //58, 59, 60, 61, 62, 63, 64 , 65, 66, 67, 68, 69 , 70, 71, 72, 73, 74, 75,
										   //76, 77, 78, 79, 80, 81]
										 //];
		private var level:int;
		public function CountryBallDao() 
		{
			var countryBallsCodeArray:Array = new Array();
			for (var countryBallCode:int = 1; countryBallCode <= 190; countryBallCode++){
				countryBallsCodeArray.push(countryBallCode);
			}
			countryBallsCodeArray = this.shuffleArray(countryBallsCodeArray);
			countryBalls.push(countryBallsCodeArray);
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
		
		// ref: http://www.kirupa.com/flash/shuffling_array.htm
		private function shuffleArray(input:Array):Array
		{
			for (var i:int = input.length-1; i >=0; i--)
			{
				var randomIndex:int = Math.floor(Math.random()*(i+1));
				var itemAtIndex:Object = input[randomIndex];
				input[randomIndex] = input[i];
				input[i] = itemAtIndex;
			}
			return input
		}
	}
}