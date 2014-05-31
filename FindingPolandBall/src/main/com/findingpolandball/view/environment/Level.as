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
		private var loadLevel:int;
		private static const GAME_TIME = 60;
		
		public function Level() 
		{
			loadLevel = 1;
			
			var gameUi:GameUI = this.getChildByName("gameUI") as GameUI;
			var gameTimer:GameTimer = gameUi.gameTimer(GAME_TIME);
		
			trace("parent.name:" + parent.name);
			generateLevel(loadLevel, gameTimer);
			
			gameUi.gamePause();
		}
		
		public function generateLevel(loadLevel:int, gameTimer:GameTimer) {
			trace("generateLevel");

			var levelMovieClip:Level1 = new Level1(this, gameTimer, loadLevel);
			trace("levelMovieClip.name:" + levelMovieClip.name);
			levelMovieClip.generateMap();
			
			var gameUi:GameUI = this.getChildByName("gameUI") as GameUI;
			gameUi.gameLevelTxt.text = String(loadLevel);
			
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