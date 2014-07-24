import UnityEngine

class RelocateAhead (MonoBehaviour): 

	public distance as single = 2500

	def OnTriggerEnter(other as Collider):
		if other.gameObject.tag == 'Kill':
			#Debug.Log("*** relocated")
			transform.position.x += distance
