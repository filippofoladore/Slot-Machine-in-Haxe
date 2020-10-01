package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.MouseEvent;
import Random;
import motion.Actuate;
import motion.easing.*;
import openfl.display.MovieClip;
import openfl.display.Shape;

class Main extends Sprite {
	
	public function new()  {
		super();
		
		var rullo1:Array<String> = ["symA.png", "symB.png", "symC.png", "symD.png", "symE.png", "symF.png", "symG.png", "symH.png", "symI.png", "symJ.png"];
		var rullo2:Array<String> = ["symA.png", "symB.png", "symC.png", "symD.png", "symE.png", "symF.png", "symG.png", "symH.png", "symI.png", "symJ.png"];
		var rullo3:Array<String> = ["symA.png", "symB.png", "symC.png", "symD.png", "symE.png", "symF.png", "symG.png", "symH.png", "symI.png", "symJ.png"];
		var rullo4:Array<String> = ["symA.png", "symB.png", "symC.png", "symD.png", "symE.png", "symF.png", "symG.png", "symH.png", "symI.png", "symJ.png"];
		var rullo5:Array<String> = ["symA.png", "symB.png", "symC.png", "symD.png", "symE.png", "symF.png", "symG.png", "symH.png", "symI.png", "symJ.png"];
		var reelOne:MovieClip = new MovieClip();
		var reelTwo:MovieClip = new MovieClip();
		var reelThree:MovieClip = new MovieClip();
		var reelFour:MovieClip = new MovieClip();
		var reelFive:MovieClip = new MovieClip();
		Random.shuffle(rullo1);
		Random.shuffle(rullo2);
		Random.shuffle(rullo3);
		Random.shuffle(rullo4);
		Random.shuffle(rullo5);
		
		addChild(reelOne);
		addChild(reelTwo);
		addChild(reelThree);
		addChild(reelFour);
		addChild(reelFive);
		
		var frameMask : Shape = new Shape();
		frameMask.graphics.beginFill(0x0000FF);
		frameMask.graphics.drawRect(0, 0, 804, 485);
		frameMask.graphics.endFill();
		addChild(frameMask);
		
		
			
		BitmapData.loadFromFile("img/ContainerReels.png").onComplete(function(bitmapData){
			var board = new Bitmap (bitmapData);
			board.x = 0;
			board.y = 0;
			addChild(board);
			board.mask = frameMask;
		});

		
		
		
		
		for (index => item in rullo1) {
			BitmapData.loadFromFile('img/$item').onComplete(function(bitmapData){
			var bitmap = new Bitmap (bitmapData);
			bitmap.x = 5;
			bitmap.y = 155 * index;
			reelOne.addChild(bitmap);	
		});
		}		
		reelOne.mask = frameMask;

		for (index => item in rullo2) {
			BitmapData.loadFromFile('img/$item').onComplete(function(bitmapData){
			var bitmap = new Bitmap (bitmapData);
			bitmap.x = 165;
			bitmap.y = 155 * index;
			reelTwo.addChild(bitmap);
		});
		}		
		
		for (index => item in rullo3) {
			BitmapData.loadFromFile('img/$item').onComplete(function(bitmapData){
			var bitmap = new Bitmap (bitmapData);
			bitmap.x = 325;
			bitmap.y = 155 * index;
			reelThree.addChild(bitmap);
		});
		}		
		
		for (index => item in rullo4) {
			BitmapData.loadFromFile('img/$item').onComplete(function(bitmapData){
			var bitmap = new Bitmap (bitmapData);
			bitmap.x = 485;
			bitmap.y = 155 * index;
			reelFour.addChild(bitmap);
		});
		}		
		
		for (index => item in rullo5) {
			BitmapData.loadFromFile('img/$item').onComplete(function(bitmapData){
			var bitmap = new Bitmap (bitmapData);
			bitmap.x = 645;
			bitmap.y = 155 * index;
			reelFive.addChild(bitmap);
		});
		}		
		


			

	
	
		
		
		
			
		BitmapData.loadFromFile ("img/Button.png").onComplete (function (bitmapData) {
			var bitmap = new Bitmap (bitmapData);
			bitmap.x = 350;
			bitmap.y = 440;
			bitmap.scaleX = 0.5;
			bitmap.scaleY = 0.5;
			var button = new Sprite ();
			button.addChild (bitmap);
			button.buttonMode = true;
			this.addChild (button);
			
			button.addEventListener (MouseEvent.MOUSE_DOWN, function (e) {
				Actuate.tween (reelOne, 0.5, { y: -485 * 4 }).ease (Quad.easeOut);
				Actuate.tween (reelTwo, 0.5, { y: -485 * 2}).ease (Quad.easeOut).delay (0.25);
				Actuate.tween (reelThree, 0.5, { y: -485 * 2}).ease (Quad.easeOut).delay (0.50);
				Actuate.tween (reelFour, 0.5, { y: -485 * 2}).ease (Quad.easeOut).delay (0.75);
				Actuate.tween (reelFive, 0.5, { y: -485 * 2}).ease (Quad.easeOut).delay (1);
			});
			
		});
		

		
			
		
		
		
	}

}


