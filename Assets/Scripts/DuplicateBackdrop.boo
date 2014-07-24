import UnityEngine

class DuplicateBackdrop (MonoBehaviour): 
	
	public tile as Transform
	public rows as int = 2
	public columns as int = 3
	public tileWidth as single = 250
	public tileHeight as single = 500

	def Start ():
		for i in range(rows):
			for j in range(columns):
				if i or j:
					newTile = Instantiate(tile)
					newTile.parent = tile.parent
					newTile.localPosition.z = tile.localPosition.z
					newTile.position.y += tileHeight * i
					newTile.position.x += tileWidth * j
