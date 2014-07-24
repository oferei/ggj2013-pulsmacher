import UnityEngine

class KillLeftBehind (MonoBehaviour): 

	public delay as single = 2
	
	#def OnBecameInvisible ():
	def OnTriggerEnter(other as Collider):
		if other.gameObject.tag == 'Kill':
			Invoke("SelfDestruct", delay)
	
	def SelfDestruct():
		Destroy(gameObject)
