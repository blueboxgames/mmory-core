package com.gerantech.mmory.core.battle.fieldes;
import com.gerantech.mmory.core.battle.tilemap.TileMap;
import com.gerantech.mmory.core.utils.lists.IntList;

/**
 * @author Mansour Djawadi
 */
class FieldData
{
	public var mode:Int;
	public var times:IntList;
	public var mapData:Dynamic;
	public var tileMap:TileMap;

	public function new(mode:Int, mapData:Dynamic, times:String) 
	{
		this.mode = mode;
		this.mapData = mapData;
		this.times = IntList.parse(times);
		
		// parse json layout and occupy tile map
		this.tileMap = new TileMap();
		this.mapData = mapData;//Json.parse(mapData);
		var children:Array<Dynamic> = this.mapData.children[0].artboard.children;
		for( o in children )
			if( o.name == "obstacle" )
				this.tileMap.setTileState((o.transform.tx - 224), (o.transform.ty - 490), o.shape.width, o.shape.height, TileMap.STATE_OCCUPIED);
	}
	
	public function isOperation() : Bool
	{
		return false;
	}
}
