import UnityEngine
import AssemblyCSharp

class GenerateTerrain (MonoBehaviour): 

	public generator as TerrainGenerator
	public initialBlocks as int = 20
	
	lastObj as Transform

	def Start ():
		for i in range(initialBlocks):
			GenBlock()
	
	def GenBlock():
		terrain = generator.getNextBlock()
		lastObj = Instantiate(terrain._image)
		lastObj.parent = terrain._image.parent
		lastObj.gameObject.SetActive(true)
		lastObj.position = Vector3(terrain._startX, terrain._startY, 0)
	
	def Update():
		if camera.WorldToViewportPoint(lastObj.position).x < 1:
			GenBlock()
