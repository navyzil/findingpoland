package com.findingpolandball.view 
{
	/**
	 * ...
	 * @author Denzil Daulo
	 */
	import com.findingpolandball.model.countryballs.CountryBall;
	import com.findingpolandball.view.environment.Level;
	import com.findingpolandball.view.userinterface.GameTimer;
	
	import flash.display.MovieClip;

	public class CountryBallView
	{
		private var levelMovieClip:MovieClip;
		private var levelCount:int;
		
		public function CountryBallView() 
		{
			
		}
		
		public function setLevelMovieClip(levelMovieClip:MovieClip):void {
			this.levelMovieClip = levelMovieClip;
		}
		
		public function getLevelMovieClip():MovieClip {
			return this.levelMovieClip;
		}

		public function setLevelCount(levelCount:int):void {
			this.levelCount = levelCount;
		}
		
		public function loadCountryBalls(levelMovieClip:MovieClip, row:int, col:int, frame:int, env:Level, gameTimer:GameTimer):CountryBall {
			var countryBall:CountryBall = new CountryBall(env);
			
			countryBall.setGameTimer(gameTimer);
			countryBall.setCurrentLevel(levelMovieClip);
			countryBall.setLevelCount(levelCount);
			
			countryBall.x = row + countryBall.width
			countryBall.y = col  + countryBall.height;
			
			countryBall.setCountryCode(frame);
			countryBall.generateCountry(frame);
			if(frame == 1){
				levelMovieClip.addChild(countryBall);
			}
			else {
				levelMovieClip.addChild(countryBall);
			}
			return countryBall;
		}				
	}
}