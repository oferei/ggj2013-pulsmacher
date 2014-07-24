import UnityEngine

class Parallax (MonoBehaviour): 
	
	public target as Transform
	public speedFactor as single = 0.2
	
	lastXPos as single

	def Start ():
		lastXPos = target.position.x
	
	def LateUpdate ():
		diff = target.position.x - lastXPos
		//Debug.Log("*** pos: " + transform.position.x + ", diff: " + diff)
		lastXPos = target.position.x
		
		transform.position.x += diff * speedFactor
