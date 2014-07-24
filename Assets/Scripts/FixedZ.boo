import UnityEngine

class FixedZ (MonoBehaviour): 
	
	originalZ as single

	def Start ():
		originalZ = transform.position.z
		#Debug.Log("*** z: " + originalZ)
	
	def FixedUpdate ():
		transform.position.z = originalZ
