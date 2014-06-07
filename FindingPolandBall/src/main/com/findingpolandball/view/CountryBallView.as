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
		private var targetCountryBall:int;
		
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
		
		public function setTargetCountryBall(targetCountryBall:int) {
			trace("setting target country");
			//targetCountryBall = 1 + Math.round(Math.random()*(maxCountryBallCount-1));
			//targetCountryBall = 1 + Math.round(Math.random()*(20-1));
			
			this.targetCountryBall = targetCountryBall;
		}
		
		public function loadCountryBalls(levelMovieClip:MovieClip, row:int, col:int, frame:int, env:Level, gameTimer:GameTimer):CountryBall {
			var countryBall:CountryBall = new CountryBall(env);
			
			countryBall.setGameTimer(gameTimer);
			countryBall.setCurrentLevel(levelMovieClip);
			countryBall.setGamePoints(levelCount);
			
			countryBall.x = row + countryBall.width
			countryBall.y = col  + countryBall.height;
			
			countryBall.setCountryCode(frame);
			countryBall.generateCountry(frame);
			
			countryBall.setTargetCountryBall(targetCountryBall);
			
			levelMovieClip.addChild(countryBall);
			return countryBall;
		}				
	}
}