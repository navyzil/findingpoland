package com.findingpolandball.dao 
{
	/**
	 * ...
	 * @author Denzil Daulo
	 */
	public class LevelDao 
	{	
		private var tileSet:Array = [
										[
											[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
											[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
											[3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3], 
											[2, 2, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1],  
											[1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 1, 2, 1, 1, 2, 2, 2, 1, 1], 
											[1, 2, 1, 2, 2, 1, 1, 2, 2, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1], 
											[2, 2, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1],
											[2, 2, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1],
											[2, 2, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1],  
											[1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 1, 2, 1, 1, 2, 2, 2, 1, 1]
										]
										
									];
		private var level:int;
		public function LevelDao() 
		{
			
		}
		
		public function setLevel(level:int):void {
			
			this.level = level;
		}
		
		public function getLevel():Array {
			return tileSet[0];
		}
		
		public function getWorldLevel():int {
			var worldLevel:int = 1;
			return worldLevel;
		}
	}

}