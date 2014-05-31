package com.findingpolandball.view.environment
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.utils.getDefinitionByName;
	
	import com.findingpolandball.view.CountryBallView;		
	import com.findingpolandball.view.environment.levels.Level1;
	/**
	 * ...
	 * @author Denzil Daulo
	 */
	public class Environment extends MovieClip 
	{
		private var stageWidth:Number;
		private var stageHeight:Number;

		public function Environment()
		{
			super();
			this.stageWidth = stage.stageWidth;
			this.stageHeight = stage.stageHeight;
			trace(this.stageWidth)
			trace(this.stageHeight)
		}
		
	}
}