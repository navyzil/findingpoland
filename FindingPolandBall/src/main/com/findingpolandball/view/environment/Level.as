package com.findingpolandball.view.environment 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.utils.getDefinitionByName;
	
	import com.findingpolandball.view.userinterface.GameTimer;
	import com.findingpolandball.view.userinterface.GameUI;
	import com.findingpolandball.view.userinterface.PauseScreen;
	import com.findingpolandball.view.environment.levels.Level1;

	/**
	 * ...
	 * @author Denzil Daulo
	 */
	public class Level extends MovieClip 
	{
		private var gamePoints:int;
		private var targetCountryBall:int;
		
		private static const GAME_TIME = 60;
		private static const MAX_COUNTRY_BALLS = 190;
		
		public function Level() 
		{
			gamePoints = 0;
			targetCountryBall = 1 + Math.round(Math.random() * (31 - 1)); //replace 20 with 190
			
			var gameUi:GameUI = this.getChildByName("gameUI") as GameUI;
			var gameTimer:GameTimer = gameUi.gameTimer(GAME_TIME);
		
			trace("parent.name:" + parent.name);
			generateLevel(gamePoints, gameTimer, targetCountryBall);
			
			gameUi.gamePause();
		}
		
		public function generateLevel(gamePoints:int, gameTimer:GameTimer, targetCountryBall:int) {
			trace("generateLevel");

			var levelMovieClip:Level1 = new Level1(this, gameTimer, gamePoints);
			trace("levelMovieClip.name:" + levelMovieClip.name);
			levelMovieClip.setTargetCountryBall(targetCountryBall);
			levelMovieClip.generateMap();
			
			var gameUi:GameUI = this.getChildByName("gameUI") as GameUI;
			gameUi.gameLevelTxt.text = String(gamePoints);
			gameUi.gameFindImage.gotoAndStop(targetCountryBall, null);
			
			this.addChild(levelMovieClip);
									
			var pauseScreen:PauseScreen = new PauseScreen();
			pauseScreen.visible = false;
			this.addChild(pauseScreen);
			
			gameUi.setPauseScreen(pauseScreen);
		}
		
		public function cleanUpLevel(levelToRemove:MovieClip) {
			trace("levelToRemove:" + levelToRemove);
			this.removeChild(levelToRemove);
		}
	}

}